#!/bin/sh
filename=$(date +%Y%m%d-%H%M%S).png
filedir=${HOME}/pic/shot
if grim -g "$(slurp)" "${filedir}/${filename}"; then
    wl-copy < "$filedir/$filename"
    notify-send -u low -i camera-photo-symbolic 'Screenshot' "Saved: ${filename} and copied to clipboard"
fi

# This is fallback option
# grim -g "$(slurp)" && notify-send 'Failed to save to ~/pic/shot/' 'running fall back command...'
