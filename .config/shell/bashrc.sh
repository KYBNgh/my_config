# ~/.config/shell/bashrc.sh
# By KYBNgh
# If not running interactively, don't do anything                                                    

case $- in # check shell options
    *i*) ;; # interactive shell
      *) return;; # don't do anything
esac

shopt -s histappend
shopt -s checkwinsize
shopt -s autocd
shopt -s globstar

HISTFILE="$XDG_DATA_HOME/bash/bash_history"
HISTCONTROL=ignoreboth
HISTSIZE=50000
HISTFILESIZE=100000
HISTIGNORE="cd:ls:ll:la:pwd:exit:clear:history:bg:fg"

set -o vi
bind -m vi-insert "\C-l":clear-screen

if [ "$TERM" == "foot" ]; then
    export TERM=xterm-256color
fi

if [ "$PREFIX" == /data/data/com.termux/files/usr ]; then
    [[ -f "/data/data/com.termux/files/usr/share/bash-completion/bash_completion" ]] && . /data/data/com.termux/files/usr/share/bash-completion/bash_completion
    [[ -f ~/.config/shell/aliases_termux.sh   ]] && . ~/.config/shell/aliases_termux.sh
    [[ -f ~/.config/shell/prompt.sh           ]] && . ~/.config/shell/prompt.sh
    [[ -f ~/.config/shell/functions_termux.sh ]] && . ~/.config/shell/functions_termux.sh
else
    [[ -f "/usr/share/bash-completion/bash_completion" ]] && . /usr/share/bash-completion/bash_completion
    [[ -f /usr/share/fzf/key-bindings.bash ]] && . /usr/share/fzf/key-bindings.bash
    [[ -f /usr/share/fzf/completion.bash ]] && . /usr/share/fzf/completion.bash
    [[ -f ~/.config/shell/aliases.sh   ]] && . ~/.config/shell/aliases.sh
    [[ -f ~/.config/shell/functions.sh ]] && . ~/.config/shell/functions.sh
    [[ -f ~/.config/shell/prompt.sh    ]] && . ~/.config/shell/prompt.sh
    [[ -f ~/.config/shell/functions.sh ]] && . ~/.config/shell/functions.sh
fi
