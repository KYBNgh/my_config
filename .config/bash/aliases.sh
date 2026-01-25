# ~/.config/bash/aliases.sh 
# General aliases
#
# Original copyright notice:
# @author nate zhou
# @since 2023,2024,2025
# general aliases for bash/zsh
#
# Modifications by @KYBNgh

# List
alias l='ls --color=auto'
alias ls='ls -F --color=auto --group-directories-first'
alias ll="ls -lh --time-style=long-iso"
alias la="ls -A"
alias lla="ls -lhA --time-style=long-iso"
alias l.="ls -d .*"
alias ll.="ls -lh -d --time-style=long-iso .*"
alias lt="ls -lt --time-style=long-iso"
alias lw="ls -ldh $(pwd)"
alias lss='du -sh .[^.]* .[!.]* * 2>/dev/null | sort -hr'

# Change directory
alias ...='cd ../..'

# Git
alias ga='git add .'
alias gc='git commit'
alias gd='git diff' 
alias gpush='git push'
alias gpull='git pull'

# Color
alias grep='grep --color=auto'
alias ip='ip -color=auto'

# Files operation
alias md='mkdir'
alias rd='rmdir'
alias rm='rm -I'
alias cp='cp -i'
alias mv='mv -i'
alias vim='nvim'

# Source configs
alias virc='vim ~/.bashrc'
alias vipf='vim ~/.profile'
alias srpf='. ~/.profile'
alias srrc='. ~/.bashrc'

# Else
alias c='clear'
alias ff='fastfetch --logo none --color blue'

alias df='df -h'
alias du='du -h -c'
alias free='free -h'
