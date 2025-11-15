### alias ###
alias l='/usr/bin/ls --color=auto'
alias ls='ls -F --color=auto --group-directories-first'
alias ll="ls -lh --time-style=long-iso"
alias la="ls -A"
alias lla="ls -lhA --time-style=long-iso"
alias l.="ls -d .*"
alias ll.="ls -lh -d --time-style=long-iso .*"
alias lt="ls -lt --time-style=long-iso"
alias lw="ls -ldh $(pwd)"
alias lx="lsix"
alias le="ls | grep -o '.[^.]*$' | sort | uniq"
alias lss='du -sh .[^.]* .[!.]* * 2>/dev/null | sort -hr'

alias grep='grep --color=auto'
alias ip='ip --color=auto'
alias md='mkdir'
alias rd='rmdir'
alias df='df -h'
alias du='du -h -c'
alias rm='rm -i'
alias free='free --si -h'

alias virc='$EDITOR ~/.bashrc'
alias srrc='source ~/.bashrc'
alias f='fastfetch'
alias r='ranger'
alias c='clear'

alias syu='sudo pacman -Syu'
alias scc='yes | sudo pacman -Scc'

