#!/bin/sh
# enp3s0 download speed (MiB/s) for Waybar

IFACE="enp3s0"

# Read RX bytes from /proc/net/dev
get_rx_bytes() {
    awk -v iface="$IFACE:" '$1 == iface { print $2 }' /proc/net/dev
}

# Two samples, 1 sec apart
rx1=$(get_rx_bytes)
sleep 1
rx2=$(get_rx_bytes)

# Calculate speed in MiB/s
if [ -z "$rx1" ] || [ -z "$rx2" ] || [ "$rx1" -eq "$rx2" ]; then
    # No traffic or invalid values
    rx_mib=0
else
    rx_bps=$((rx2 - rx1))
    rx_mib=$(awk "BEGIN {
        val = $rx_bps / 1048576;
        # Show integer without .0, else one decimal
        if (val == int(val))
            printf \"%d\", val
        else
            printf \"%.1f\", val
    }")
fi

# Output JSON for Waybar
ip_addr=$(ip addr show "$IFACE" 2>/dev/null | awk '/inet / {print $2; exit}' || echo "N/A")
printf '{"text": " 󰲝 %s MiB/s ", "alt": "%s"}\n' "$rx_mib" "$ip_addr"
