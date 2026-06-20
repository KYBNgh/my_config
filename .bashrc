# ~/.bashrc
# QwQ Meow!!

case $- in   # check shell options
*i*) ;;      # interactive shell
*) return ;; # don't do anything
esac

shopt -s histappend
shopt -s checkwinsize
shopt -s autocd
shopt -s globstar

set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

complete -F _command doas
umask 0077

# History
HISTFILE="$XDG_DATA_HOME/bash/bash_history"
HISTCONTROL=ignoreboth
HISTSIZE=50000
HISTFILESIZE=100000
HISTIGNORE="cd:ls:ll:la:c:pwd:exit:clear:history:bg:fg:ff:lsblk:lb:#:.."
BASH_CONFIG="$XDG_CONFIG_HOME/bash"

export GPG_TTY=$(tty)

mkdir -p "$(dirname "$HISTFILE")" 2>/dev/null

if command -v fzf 2>&1 > /dev/null; then
    eval "$(fzf --bash)"
fi

if command -v dircolors 2>&1 > /dev/null; then
    eval "$(dircolors -b)"
fi


load() {
    if [ -f "$1" ]; then
        . "$1"
    fi
}

load "${BASH_CONFIG}/aliases.sh"

# "is_termux" had been set in .profile
if [ -v "$is_termux" ] || [ "$PREFIX" = /data/data/com.termux/files/usr ]; then

    # Termux
    load "${BASH_CONFIG}/termux/aliases.sh"
    load "${BASH_CONFIG}/termux/prompt.sh"

    if [ -f "$INPUTRC" ]; then bind -f "$INPUTRC"; fi

    if [ -d "${BASH_CONFIG}/termux/completions" ]; then
        for completion in "${BASH_CONFIG}"/termux/completions/*; do . "${completion}"; done
    fi

    if [ -d "${BASH_CONFIG}/termux/unshare" ]; then
        for unshare in "${BASH_CONFIG}"/termux/unshare/*; do . "$unshare"; done
    fi
    
    # In new tab
    cd ~

else

    # GNU/Linux
    load "/usr/share/doc/pkgfile/command-not-found.bash" 
    load "${BASH_CONFIG}/${HOSTNAME}/aliases.sh"
    load "${BASH_CONFIG}/${HOSTNAME}/prompt.sh" 
    load "${BASH_CONFIG}/${HOSTNAME}/proxy.sh" 
    load "${BASH_CONFIG}/${HOSTNAME}/socks.sh" 

    if [ -d "${BASH_CONFIG}/${HOSTNAME}/completions" ]; then
        for completion in ${BASH_CONFIG}/${HOSTNAME}/completions/*; do . "${completion}"; done
    fi

    if [ -d "${BASH_CONFIG}/${HOSTNAME}/unshare" ]; then
        for unshare in "${BASH_CONFIG}"/"${HOSTNAME}"/unshare/*; do . "$unshare"; done
    fi
fi

# Drop the function
unset -f load
