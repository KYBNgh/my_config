#!/bin/sh
filename=$(date +%Y%m%d-%H%M%S).png
filedir=${HOME}/pic/shot
grim ${filedir}/${filename} && notify-send -u low -i camera-photo-symbolic "Screenshot" "Saved: ${filename}" 
