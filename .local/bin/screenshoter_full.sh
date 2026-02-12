#!/bin/sh
filename=$(date +%Y%m%d-%H%M%S).png
filedir=${HOME}/pic/shot
if grim "${filedir}/${filename}"; then
    notify-send -u low -i camera-photo-symbolic 'Screenshot' "Saved: ${filename}"
else
    grim && notify-send 'Failed to save to ~/pic/shot/' 'running fall back command...'
fi

