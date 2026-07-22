#!/bin/sh
# Waybar custom clock module
# - Left click: nothing
# - Right click: nothing
# - Hover: shows full date

while true; do
    time_str=$(date '+ %H:%M:%S')
    
    date_str=$(date '+%Y-%m-%d %a')
    
    printf '{"text": "%s", "tooltip": "%s"}\n' "$time_str" "$date_str"
    
    sleep 1
done
