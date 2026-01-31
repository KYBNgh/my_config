#!/bin/sh
# 网络流量监控（仅下载，单位 MiB/s）
# 适配你的 enp3s0 接口

IFACE="enp3s0"

# 读取 /proc/net/dev 获取 RX 字节
get_rx_bytes() {
    awk -v iface="$IFACE:" '$1 == iface { print $2 }' /proc/net/dev
}

# 获取两次 RX 值，间隔 1 秒
rx1=$(get_rx_bytes)
sleep 1
rx2=$(get_rx_bytes)

# 计算 B/s
if [ -z "$rx1" ] || [ -z "$rx2" ] || [ "$rx1" -eq "$rx2" ]; then
    # 无变化或无效值 → 0 MiB/s
    rx_mib=0
else
    rx_bps=$((rx2 - rx1))
    # 转换为 MiB/s，保留一位小数（但整数时不显示 .0）
    rx_mib=$(awk "BEGIN {
        val = $rx_bps / 1048576;
        if (val == int(val)) printf \"%d\", val;
        else printf \"%.1f\", val;
    }")
fi

# 输出 JSON（Waybar custom 模块）
printf '{"text": " 󰲝 %s MiB/s ", "alt": "%s"}\n' \
    "$rx_mib" \
    "$(ip addr show "$IFACE" 2>/dev/null | awk '/inet / {print $2; exit}' || echo "N/A")"
