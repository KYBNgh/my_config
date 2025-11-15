### alias ###
alias ls='ls -F --color=auto --group-directories-first'
alias ll="ls -lh --time-style=long-iso"
alias la="ls -A"
alias lla="ls -lhA --time-style=long-iso"
alias l.="ls -d .*"
alias ll.="ls -lh -d --time-style=long-iso .*"
alias lt="ls -lt --time-style=long-iso"
alias lw="ls -ldh $(pwd)"
alias le="ls | grep -o '.[^.]*$' | sort | uniq"
alias lss='du -sh .[^.]* .[!.]* * 2>/dev/null | sort -hr'
alias l='ls'

alias grep='grep --color=auto'
alias md='mkdir'
alias rd='rmdir'
alias df='df -h'
alias du='du -h -c'
alias rm='rm -i'
alias free='free --si -h'

alias virc='$EDITOR ~/.bashrc'
alias srrc='source ~/.bashrc'
alias vialias='$EDITOR ~/.config/bash/aliases.sh'
alias f='fastfetch'
alias r='ranger'
alias c='clear'

alias syu='sudo pacman -Syu'
alias scc='yes | sudo pacman -Scc'

