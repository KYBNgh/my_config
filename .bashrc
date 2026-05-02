# ~/.bashrc
# @KYBNgh

case $- in # check shell options
    *i*) ;; # interactive shell
      *) return;; # don't do anything
esac

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
ulimit -c unlimited
umask 0077

HISTFILE="$XDG_DATA_HOME/bash/bash_history"
HISTCONTROL=ignoreboth
HISTSIZE=50000
HISTFILESIZE=100000
HISTIGNORE="cd:ls:ll:la:c:pwd:exit:clear:history:bg:fg:ff:lsblk:lb:#:.."

if [ "$TERM" = "foot" ]; then
    export TERM=xterm-256color
fi

BASH_CONFIG="${HOME}/.config/bash"

if [ -f "${BASH_CONFIG}/aliases.sh" ]; then . ${BASH_CONFIG}/aliases.sh; fi

if [ "$PREFIX" = /data/data/com.termux/files/usr ]; then
    if [ -f "${PREFIX}/share/fzf/key-bindings.bash" ]; then . $PREFIX/share/fzf/key-bindings.bash; fi
    if [ -f "${BASH_CONFIG}/termux/aliases.sh" ]; then . ${BASH_CONFIG}/termux/aliases.sh; fi
    if [ -f "${BASH_CONFIG}/termux/prompt.sh" ]; then . ${BASH_CONFIG}/termux/prompt.sh; fi
else
    if [ -f "/usr/share/doc/pkgfile/command-not-found.bash" ]; then . /usr/share/doc/pkgfile/command-not-found.bash;fi
    if [ -f "/usr/share/fzf/key-bindings.bash" ]; then . /usr/share/fzf/key-bindings.bash;fi
    if [ -f "/usr/share/fzf/completion.bash" ]; then . /usr/share/fzf/completion.bash;fi
    if [ -f ${HOME}/.config/bash/${HOSTNAME}/aliases.sh ]; then . ${HOME}/.config/bash/${HOSTNAME}/aliases.sh;fi
    if [ -f ${HOME}/.config/bash/${HOSTNAME}/prompt.sh ]; then . ${HOME}/.config/bash/${HOSTNAME}/prompt.sh;fi
fi

