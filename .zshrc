# ~/.zshrc

case $- in   # check shell options
*i*) ;;      # interactive shell
*) return ;; # don't do anything
esac

HISTFILE=~/.local/share/zsh/zsh_history
HISTSIZE=50000
SAVEHIST=100000

setopt autocd

set -o vi
bindkey -v

zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump

eval "$(fzf --zsh)"
