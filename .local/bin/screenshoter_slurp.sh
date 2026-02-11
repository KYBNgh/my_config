#!/bin/sh
filename=$(date +%Y%m%d-%H%M%S).png
filedir=${HOME}/pic/shot
if grim -g "$(slurp)" "${filedir}/${filename}"; then
    notify-send -u low -i camera-photo-symbolic 'Screenshot' "Saved: ${filename}"
fi

