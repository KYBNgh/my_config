# ~/.config/bash/multi/proxy.sh

proxy_drop() {
    unset http_proxy https_proxy ftp_proxy no_proxy
    unset HTTP_PROXY HTTPS_PROXY FTP_PROXY NO_PROXY
    echo "All proxy setting jumped to drop"
}

proxyctl() {
    case "$1" in
        lan)
            case "$2" in
                up|on|start)
                    export http_proxy="http://192.168.31.20:8080"
                    export https_proxy="$http_proxy"
                    export ftp_proxy="$http_proxy"
                    export no_proxy="localhost,127.0.0.1,.local"

                    export HTTP_PROXY="$http_proxy"
                    export HTTPS_PROXY="$https_proxy"
                    export FTP_PROXY="$ftp_proxy"
                    export NO_PROXY="$no_proxy"
                    echo "Lan proxy $http_proxy is up"
                    ;;
                down|off|stop|drop)
                    proxy_drop
                    ;;
                *)
                    echo "Usage: proxyctl lan {up|down}"
                    return 1
                    ;;
            esac
            ;;
        lo|local)
            case "$2" in
                up|on|start)
                    export http_proxy="http://127.0.0.1:7897"
                    export https_proxy="$http_proxy"
                    export ftp_proxy="$http_proxy"
                    export no_proxy="localhost,127.0.0.1,.local"

                    export HTTP_PROXY="$http_proxy"
                    export HTTPS_PROXY="$https_proxy"
                    export FTP_PROXY="$ftp_proxy"
                    export NO_PROXY="$no_proxy"
                    echo "Local proxy $http_proxy is up"
                    ;;
                down|off|stop|drop)
                    proxy_drop
                    ;;
                *)
                    echo "Usage: proxyctl lo {up|down}"
                    return 1
                    ;;
            esac
            ;;
        drop|off|down)
            proxy_drop
            ;;
        status)
            echo "http_proxy  = ${http_proxy:-Not set yet}"
            echo "https_proxy = ${https_proxy:-Not set yet}"
            echo "ftp_proxy   = ${ftp_proxy:-Not set yet}"
            echo "no_proxy    = ${no_proxy:-Not set yet}"
            ;;
        *)
            echo "Usage: proxyctl {lan|lo|drop|status} [up|down]"
            return 1
            ;;
    esac
}

