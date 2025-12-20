# ~/.config/shell/bashrc.sh
# By KYBNgh
# If not running interactively, don't do anything                                                    
[[ $- != *i* ]] && return     

shopt -s histappend
shopt -s checkwinsize
shopt -s autocd
shopt -s globstar
HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=10000

set -o vi
bind -m vi-insert "\C-l":clear-screen
# printf '\e[5 q'


# Git prompt sourcing had been moved to ~/.config/shell/prompt.sh
#[[ -f "/usr/share/git/completion/git-prompt.sh" ]] && . /usr/share/git/completion/git-prompt.sh

# Disabled
# [[ -f /usr/share/doc/find-the-command/ftc.bash ]] && . /usr/share/doc/find-the-command/ftc.bash

[[ -f "/usr/share/bash-completion/bash_completion" ]] && . /usr/share/bash-completion/bash_completion
[[ -f ~/.config/shell/aliases.sh   ]] && . ~/.config/shell/aliases.sh
[[ -f ~/.config/shell/functions.sh ]] && . ~/.config/shell/functions.sh
[[ -f ~/.config/shell/prompt.sh    ]] && . ~/.config/shell/prompt.sh
[[ -f ~/.config/shell/functions.sh ]] && . ~/.config/shell/functions.sh
