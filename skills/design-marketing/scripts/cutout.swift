// Usage: swift cutout.swift <input.png> <outdir> <prefix>
// Detects every foreground subject with Vision and writes one transparent PNG per subject,
// cropped to its extent, ordered top-to-bottom then left-to-right.
import Foundation
import Vision
import CoreImage
import AppKit

let args = CommandLine.arguments
guard args.count == 4 else { print("usage: cutout <in> <outdir> <prefix>"); exit(1) }
let inURL = URL(fileURLWithPath: args[1])
let outDir = URL(fileURLWithPath: args[2])
let prefix = args[3]

guard let ciImage = CIImage(contentsOf: inURL) else { print("cannot read"); exit(1) }
let handler = VNImageRequestHandler(ciImage: ciImage)
let request = VNGenerateForegroundInstanceMaskRequest()
try handler.perform([request])
guard let result = request.results?.first else { print("no subject"); exit(1) }

let ctx = CIContext()
var items: [(CGRect, CVPixelBuffer)] = []
for idx in result.allInstances {
  let buf = try result.generateMaskedImage(ofInstances: IndexSet(integer: idx), from: handler, croppedToInstancesExtent: false)
  // bounding box from the instance mask
  let mask = try result.generateScaledMaskForImage(forInstances: IndexSet(integer: idx), from: handler)
  let maskImg = CIImage(cvPixelBuffer: mask)
  // compute extent of non-zero alpha by sampling
  CVPixelBufferLockBaseAddress(mask, .readOnly)
  let w = CVPixelBufferGetWidth(mask), h = CVPixelBufferGetHeight(mask)
  let rb = CVPixelBufferGetBytesPerRow(mask)
  let base = CVPixelBufferGetBaseAddress(mask)!.assumingMemoryBound(to: Float32.self)
  var minX = w, minY = h, maxX = 0, maxY = 0
  for y in stride(from: 0, to: h, by: 2) {
    let row = base.advanced(by: y * rb / 4)
    for x in stride(from: 0, to: w, by: 2) where row[x] > 0.5 {
      minX = min(minX, x); maxX = max(maxX, x); minY = min(minY, y); maxY = max(maxY, y)
    }
  }
  CVPixelBufferUnlockBaseAddress(mask, .readOnly)
  _ = maskImg
  if maxX <= minX || maxY <= minY { continue }
  items.append((CGRect(x: minX, y: minY, width: maxX - minX, height: maxY - minY), buf))
}
// sort rows (top-to-bottom, tolerance 20% of height) then left-to-right
let H = ciImage.extent.height
items.sort { a, b in
  if abs(a.0.midY - b.0.midY) > H * 0.2 { return a.0.midY < b.0.midY }
  return a.0.minX < b.0.minX
}
for (i, item) in items.enumerated() {
  let pad: CGFloat = 12
  let full = CIImage(cvPixelBuffer: item.1)
  // pixel-buffer rows are top-down; CIImage origin is bottom-left
  let r = item.0
  let crop = CGRect(x: max(0, r.minX - pad), y: max(0, H - r.maxY - pad),
                    width: min(full.extent.width, r.width + 2 * pad),
                    height: min(full.extent.height, r.height + 2 * pad))
  let cropped = full.cropped(to: crop)
  guard let cg = ctx.createCGImage(cropped, from: cropped.extent) else { continue }
  let rep = NSBitmapImageRep(cgImage: cg)
  let data = rep.representation(using: .png, properties: [:])!
  let url = outDir.appendingPathComponent(String(format: "%@-%02d.png", prefix, i + 1))
  try data.write(to: url)
  print(url.lastPathComponent, Int(r.width), "x", Int(r.height))
}
