#!/bin/sh

OUTPUT="HDMI-A-2"
MODE_1440="2560x1440@59.951Hz"
MODE_1080="1920x1080@120.000Hz"

get_current() {
    swaymsg -t get_outputs | jq -r ".[] | select(.name==\"$OUTPUT\") | .current_mode.width"
}

if [ "$1" = "toggle" ]; then
    current=$(get_current)
    if [ "$current" = "2560" ]; then
        swaymsg output "$OUTPUT" resolution "$MODE_1080"
    else
        swaymsg output "$OUTPUT" resolution "$MODE_1440"
    fi
    sleep 1
    pkill -x waybar 2>/dev/null
    waybar &
else
    current=$(get_current)
    if [ "$current" = "2560" ]; then
        echo " 1440p"
    else
        echo " 1080p"
    fi
fi
