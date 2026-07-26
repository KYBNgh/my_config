#!/bin/sh
set -u

pidfile="${XDG_RUNTIME_DIR:-/tmp}/wf-recorder.pid"

pid=""
[ -f "$pidfile" ] && pid=$(cat "$pidfile" 2>/dev/null)

if [ -n "$pid" ] && kill -0 "$pid" 2>/dev/null; then
    start=$(stat -c %Y "$pidfile")
    secs=$(( $(date +%s) - start ))
    [ "$secs" -lt 0 ] && secs=0
    elapsed=$(printf '%02d:%02d:%02d' $((secs/3600)) $(((secs%3600)/60)) $((secs%60)))
    printf '{"text": "⏺ Recording", "tooltip": "Recording · %s", "class": "recording"}\n' "$elapsed"
else
    [ -n "$pid" ] && rm -f "$pidfile"
    printf '{"text": ""}\n'
fi
