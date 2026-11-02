#!/bin/zsh
# Exports an A4 HTML page to PDF with Chrome, then rasterizes small previews for review.
# Usage: pdf.sh <fichier.html> <fichier.pdf> <dossier-apercus>
set -e
setopt NULL_GLOB
HTML="$1"; PDF="$2"; PREV="$3"
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless=new --disable-gpu \
  --no-pdf-header-footer --virtual-time-budget=15000 --run-all-compositor-stages-before-draw \
  --print-to-pdf="$PDF" "file://$HTML" >/dev/null 2>&1
pdfinfo "$PDF" | grep -E "Pages|Page size"
mkdir -p "$PREV"; rm -f "$PREV"/p-*.png
pdftoppm -r 60 -png "$PDF" "$PREV/p"
ls "$PREV"
