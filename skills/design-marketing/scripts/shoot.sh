#!/bin/zsh
# Captures an HTML page (WebGL included) and slices it into parts that are easy to review.
# Usage: shoot.sh <fichier.html ou URL> <dossier-sortie> [hauteur=6400] [params, ex. "?t=8"]
set -e
setopt NULL_GLOB
SRC="$1"; OUT="$2"; H="${3:-6400}"; Q="${4:-}"
mkdir -p "$OUT"
[[ "$SRC" == http* ]] && URL="$SRC$Q" || URL="file://$SRC$Q"
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless=new \
  --enable-unsafe-swiftshader --use-angle=swiftshader --hide-scrollbars \
  --window-size=1440,"$H" --virtual-time-budget=20000 \
  --screenshot="$OUT/full.png" "$URL" >/dev/null 2>&1
rm -f "$OUT"/part*.png
N=$(( (H + 999) / 1000 ))
for i in $(seq 0 $((N - 1))); do
  magick "$OUT/full.png" -crop 1440x1000+0+$((i * 1000)) +repage -resize 1100x "$OUT/part$i.png"
done
ls "$OUT"
