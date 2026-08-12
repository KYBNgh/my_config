# ~/.config/bash/multi/socks.sh

_socks_drop() {
    unset socks_proxy SOCKS_PROXY
    unset all_proxy ALL_PROXY
    unset no_proxy NO_PROXY
    echo "All SOCKS5 proxy settings dropped"
}

socksctl() {
    case "$1" in
        lan)
            case "$2" in
                up)
                    export socks_proxy="socks5://192.168.31.20:1080"
                    export all_proxy="$socks_proxy"
                    export no_proxy="localhost,127.0.0.1,.local"

                    export SOCKS_PROXY="$socks_proxy"
                    export ALL_PROXY="$all_proxy"
                    export NO_PROXY="$no_proxy"
                    echo "Lan SOCKS5 proxy $socks_proxy is set to up"
                    ;;
                down|drop)
                    _socks_drop
                    ;;
                *)
                    echo "Usage: socksctl lan {up|down}"
                    return 1
                    ;;
            esac
            ;;
        lo)
            case "$2" in
                up)
                    export socks_proxy="socks5://127.0.0.1:1080"
                    export all_proxy="$socks_proxy"
                    export no_proxy="localhost,127.0.0.1,.local"

                    export SOCKS_PROXY="$socks_proxy"
                    export ALL_PROXY="$all_proxy"
                    export NO_PROXY="$no_proxy"
                    echo "Local SOCKS5 proxy $socks_proxy is set to up"
                    ;;
                down|drop)
                    _socks_drop
                    ;;
                *)
                    echo "Usage: socksctl lo {up|down}"
                    return 1
                    ;;
            esac
            ;;
        drop|down)
            _socks_drop
            ;;
        status)
            echo "socks_proxy = ${socks_proxy:-Not set yet}"
            echo "all_proxy   = ${all_proxy:-Not set yet}"
            echo "no_proxy    = ${no_proxy:-Not set yet}"
            ;;
        *)
            echo "Usage: socksctl {lan|lo|drop|status} [up|down]"
            return 1
            ;;
    esac
}
