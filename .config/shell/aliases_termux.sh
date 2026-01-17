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

alias grep='grep --color=auto'

alias md='mkdir'
alias rd='rmdir'
alias rm='rm -I'
alias cp='cp -i'
alias mv='mv -i'

alias virc='vim ~/.bashrc'
alias vipf='vim ~/.profile'
alias vialias='vim ~/.config/shell/aliases_termux.sh'
alias srpf='. ~/.profile'
alias srrc='. ~/.bashrc'

alias c='clear'
alias vim='nvim'

alias sshpc='ssh arch'
alias sync-doc='rsync -av --exclude="containers" arch:/home/mmc0/doc/ ~/doc'

dev()
{
    local toybox="/system/bin"
    local base="/data/data/com.termux"
    ${toybox}/mv ${base}/files ${base}/files-main
    ${toybox}/mv ${base}/files-dev ${base}/files
    pkill -9 com.termux
}

tmoe()
{
    local toybox="/system/bin"
    local base="/data/data/com.termux"
    ${toybox}/mv ${base}/files ${base}/files-main
    ${toybox}/mv ${base}/files-tmoe ${base}/files
    pkill -9 com.termux
}
