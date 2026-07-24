#!/bin/sh
# server(pc) to android by termux
# it should be run in termux
# configuration

set -u
# ssh host
children_home="$HOME/.local/lib/sync"
remote_host="username"
remote_user="username"

ssh \
  -o ConnectTimeout=1 \
  -o BatchMode=yes \
  -q \
  "$remote_host" "exit" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "LAN connection successful, using host: $remote_host"
else
    # using tailscale
    echo "LAN connection failed (timeout), using host: ${remote_host}-tail"
    export remote_host="${remote_host}-tail"
fi

. "$children_home/_common.sh"

for children in "$children_home"/*.sh; do
    . "$children"
done
