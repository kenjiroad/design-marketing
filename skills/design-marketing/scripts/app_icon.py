"""Turns a cut-out mascot (front view, transparent PNG) into an app icon.

Usage:
  python3 -I app_icon.py <mascotte-face.png> <dossier-sortie> [couleur1] [couleur2] [part-tete]

  couleur1 / couleur2 : the gradient (default: deep blue #0A3D91 -> lagoon #2FB6F0)
  part-tete           : share of the figure height kept as the head (default 0.40)

Writes <dossier>/mascotte-tete.png, mascotte-app-icon.png (1024) and mascotte-app-icon-256.png.
"""
import math
import sys

from PIL import Image, ImageDraw, ImageFilter


def hex_rgb(h):
    h = h.lstrip('#')
    return tuple(int(h[i:i + 2], 16) for i in (0, 2, 4))


src, out = sys.argv[1], sys.argv[2]
c1 = hex_rgb(sys.argv[3]) if len(sys.argv) > 3 else (10, 61, 145)
c2 = hex_rgb(sys.argv[4]) if len(sys.argv) > 4 else (47, 182, 240)
head_share = float(sys.argv[5]) if len(sys.argv) > 5 else 0.40

im = Image.open(src).convert('RGBA')
head = im.crop((0, 0, im.width, int(im.height * head_share)))
head = head.crop(head.getchannel('A').getbbox())
head.save(f'{out}/mascotte-tete.png')

S = 1024
bg = Image.new('RGBA', (S, S))
px = bg.load()
for y in range(S):
    for x in range(S):
        t = (x * 0.45 + y * 0.9) / (S * 1.35)
        r, g, b = (c1[i] + (c2[i] - c1[i]) * t for i in range(3))
        glow = max(0.0, 1 - math.hypot(x - S * 0.5, y - S * 0.42) / (S * 0.55)) ** 2 * 0.45
        px[x, y] = (int(r + (255 - r) * glow), int(g + (255 - g) * glow), int(b + (255 - b) * glow * 0.6), 255)

# the head fills 86 % of the width and is anchored at the bottom, as if it comes out of the frame
scale = S * 0.86 / head.width
head2 = head.resize((int(head.width * scale), int(head.height * scale)), Image.LANCZOS)
x, y = (S - head2.width) // 2, S - head2.height + int(S * 0.06)
shadow = Image.new('RGBA', (S, S), (0, 0, 0, 0))
sh = Image.new('RGBA', head2.size, (6, 30, 80, 110))
sh.putalpha(head2.getchannel('A').point(lambda a: a * 0.45))
shadow.paste(sh, (x, y + 18), sh)
bg = Image.alpha_composite(bg, shadow.filter(ImageFilter.GaussianBlur(22)))
bg.alpha_composite(head2, (x, y))

mask = Image.new('L', (S, S), 0)
ImageDraw.Draw(mask).rounded_rectangle((0, 0, S - 1, S - 1), radius=230, fill=255)
icon = Image.new('RGBA', (S, S), (0, 0, 0, 0))
icon.paste(bg, (0, 0), mask)
icon.save(f'{out}/mascotte-app-icon.png')
icon.resize((256, 256), Image.LANCZOS).save(f'{out}/mascotte-app-icon-256.png')
print('ok', head.size)
