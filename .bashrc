# ${HOME}/.config/bash/bashrc.sh
# @KYBNgh

case $- in # check shell options
    *i*) ;; # interactive shell
      *) return;; # don't do anything
esac

shopt -s histappend
shopt -s checkwinsize
shopt -s autocd
shopt -s globstar

set -o vi
bind -m vi-insert "\C-l":clear-screen
umask 0077

HISTFILE="$XDG_DATA_HOME/bash/bash_history"
HISTCONTROL=ignoreboth
HISTSIZE=50000
HISTFILESIZE=100000
HISTIGNORE="cd:ls:ll:la:pwd:exit:clear:history:bg:fg"


if [ "$TERM" = "foot" ]; then
    export TERM=xterm-256color
fi

BASH_CONFIG="${HOME}/.config/bash"

[[ -f "${BASH_CONFIG}/aliases.sh" ]] && . ${BASH_CONFIG}/aliases.sh

if [ "$PREFIX" = /data/data/com.termux/files/usr ]; then
    [[ -f "${PREFIX}/share/bash-completion/bash_completion" ]] && . /data/data/com.termux/files/usr/share/bash-completion/bash_completion
    [[ -f "${BASH_CONFIG}/termux/aliases.sh" ]] && . ${BASH_CONFIG}/termux/aliases.sh
    [[ -f "${BASH_CONFIG}/termux/prompt.sh"  ]] && . ${BASH_CONFIG}/termux/prompt.sh
else
    [[ -f "/usr/share/doc/pkgfile/command-not-found.bash" ]] && . /usr/share/doc/pkgfile/command-not-found.bash
    [[ -f "/usr/share/bash-completion/bash_completion" ]] && . /usr/share/bash-completion/bash_completion
    [[ -f "/usr/share/fzf/key-bindings.bash" ]] && . /usr/share/fzf/key-bindings.bash
    [[ -f "/usr/share/fzf/completion.bash"   ]] && . /usr/share/fzf/completion.bash
    [[ -f ${HOME}/.config/bash/${HOSTNAME}/aliases.sh    ]] && . ${HOME}/.config/bash/${HOSTNAME}/aliases.sh
    [[ -f ${HOME}/.config/bash/${HOSTNAME}/prompt.sh    ]] && . ${HOME}/.config/bash/${HOSTNAME}/prompt.sh
fi
