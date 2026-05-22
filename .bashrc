# ~/.bashrc
# @KYBNgh

case $- in   # check shell options
*i*) ;;      # interactive shell
*) return ;; # don't do anything
esac

# If terminal is foot, set it to xterm-256color
if [ "$TERM" = "foot" ]; then
    export TERM=xterm-256color
fi

shopt -s histappend
shopt -s checkwinsize
shopt -s autocd
shopt -s globstar

# Set vi mode
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# Make doas completion as sudo
complete -cf doas
umask 0077
export GPG_TTY=$(tty) 

# History
HISTFILE="$XDG_DATA_HOME/bash/bash_history"
HISTCONTROL=ignoreboth
HISTSIZE=50000
HISTFILESIZE=100000
HISTIGNORE="cd:ls:ll:la:c:pwd:exit:clear:history:bg:fg:ff:lsblk:lb:#:.."

BASH_CONFIG="${HOME}/.config/bash"

if command -v fzf 2>&1 >/dev/null; then
    eval "$(fzf --bash)"
fi

if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
fi

if [ -f "${BASH_CONFIG}/aliases.sh" ]; then . ${BASH_CONFIG}/aliases.sh; fi

if [ "$PREFIX" = /data/data/com.termux/files/usr ]; then

    # Termux config
    if [ -f "${BASH_CONFIG}/termux/aliases.sh" ]; then . ${BASH_CONFIG}/termux/aliases.sh; fi
    if [ -f "${BASH_CONFIG}/termux/prompt.sh" ]; then . ${BASH_CONFIG}/termux/prompt.sh; fi

    if [ -d "${BASH_CONFIG}/termux/completions" ]; then
        for completion in ${BASH_CONFIG}/termux/completions/*; do . "${completion}"; done
    fi

    if [ -d "${BASH_CONFIG}/termux/unshare" ]; then
        for unshare in ${BASH_CONFIG}/termux/unshare/*; do . "$unshare"; done
    fi

else

    # PC config
    if [ -f "/usr/share/doc/pkgfile/command-not-found.bash" ]; then . /usr/share/doc/pkgfile/command-not-found.bash; fi
    if [ -f "/usr/share/fzf/key-bindings.bash" ]; then . /usr/share/fzf/key-bindings.bash; fi
    if [ -f "${BASH_CONFIG}/${HOSTNAME}/aliases.sh" ]; then . ${HOME}/.config/bash/${HOSTNAME}/aliases.sh; fi
    if [ -f "${BASH_CONFIG}/${HOSTNAME}/prompt.sh" ]; then . ${HOME}/.config/bash/${HOSTNAME}/prompt.sh; fi

    if [ -d "${BASH_CONFIG}/${HOSTNAME}/completions" ]; then
        for completion in ${BASH_CONFIG}/${HOSTNAME}/completions/*; do . "${completion}"; done
    fi

    if [ -d "${BASH_CONFIG}/${HOSTNAME}/unshare" ]; then
        for unshare in ${BASH_CONFIG}/${HOSTNAME}/unshare/*; do . "$unshare"; done
    fi
fi

# Set Proxy, as functions
proxy-up-lan() {
    export http_proxy="http://192.168.31.20:8080"
    export https_proxy=$http_proxy
    export ftp_proxy="http://192.168.31.20:8080"
    export no_proxy="localhost,127.0.0.1,.local"
}

proxy-up-local() {
    export http_proxy="http://127.0.0.1:7897"
    export https_proxy=$http_proxy
    export ftp_proxy="http://127.0.0.1:7897"
    export no_proxy="localhost,127.0.0.1,.local"
}

proxy-down() {
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset no_proxy
}

