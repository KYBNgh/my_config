# /root/.basbrc

case $- in
	*i*) ;;
	 *) return;;
esac

if [ -f "/usr/share/bash-completion/bash_completion" ]; then
	. /usr/share/bash-completion/bash_completion
fi

umask 077

shopt -s histappend
shopt -s checkwinsize
shopt -s autocd
shopt -s globstar

HISTCONTROL=ignoreboth
HISTSIZE=10
HISTFILESIZE=10
HISTIGNORE="cd:ls:ll:la:pwd:exit:clear:history:bg:fg"

set -o vi
bind -m vi-insert "\C-l":clear-screen

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

# Color
alias grep='grep --color=auto'
alias ip='ip -color=auto'

# Files operation
alias md='mkdir'
alias rd='rmdir'
alias rm='rm -I'
alias cp='cp -i'
alias mv='mv -i'
alias ul='unlink'

if command -v nvim &>/dev/null; then
    alias vim='nvim'
fi

# System
alias df='df -h'
alias du='du -h -c'
alias free='free -h'

alias reboot='systemctl reboot'
alias poweroff='systemctl poweroff'

# PS1
PS1='$(EXIT_CODE=$?; if [ $EXIT_CODE -ne 0 ]; then echo "\[\033[1;38;5;15m\]$EXIT_CODE \[\033[0m\]";fi)\[\033[30;107m\]\u@\h\[\033[00;00m\] \[\033[01;40m\]\W\[\033[00;00m\]\[\033[1;38;5;15m\] \$\[\033[0m\] '
