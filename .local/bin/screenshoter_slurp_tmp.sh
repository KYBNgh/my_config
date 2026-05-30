#!/bin/sh
filename=$(date +%Y%m%d-%H%M%S).png
filedir=${HOME}/tmp/
if grim -g "$(slurp)" -c "${filedir}/${filename}"; then
    notify-send -u low -i camera-photo-symbolic 'Screenshot' "Saved: ${filename}"
fi

