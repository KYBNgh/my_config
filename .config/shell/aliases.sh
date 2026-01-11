# ~/.config/shell/aliases.sh
# 
# Original copyright notice:
# @author nate zhou
# @since 2023,2024,2025
# general aliases for bash/zsh
#
# Modifications by KYBNgh:
# Add lss to list size
# Add aliases for edit, source dotfiles

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
alias ,da='~/data'
alias ,D='~/dls'
alias ,d='~/doc'
alias ,m='~/mus'
alias ,v='~/vid'
alias ,V='~/vms'
alias ,t='~/tmp'
alias ,g='~/git'
alias ,gm='~/git/my_config'
alias ,gt='~/git/tmp'
alias ,pi='~/pkg/iso'
alias ,.c='~/.config/'
alias ,img='/var/lib/libvirt/images/'

# Git
alias ga='git add .'
alias gc='git commit'
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
alias ul='unlink'

# Edit/Source configs
alias virc='vim ~/.bashrc'
alias vipf='vim ~/.profile'
alias vialias='vim ~/.config/shell/aliases.sh'
alias viprompt='vim ~/.config/shell/prompt.sh'
alias vikitty='vim ~/.config/kitty/kitty.conf'
alias visway='vim ~/.config/sway/config'
alias vidiary='vim ~/doc/personal/diary/$(date +%Y-%m-%d.txt)'

alias srpf='. ~/.profile'
alias srrc='. ~/.bashrc'

# SSH
alias ssharchvm='TERM=xterm-256color ssh archvm'
alias sshrocky='TERM=xterm-256color ssh rocky'

# Else
alias n='ncmpcpp'
alias c='clear'
alias qwen-run='ollama run qwen3:8b'
alias qwen-stop='ollama stop qwen3:8b'
alias ff='fastfetch --logo none --color blue'
alias vim='nvim'

# System
alias sudo='sudo -p "[sudo] (%u to %U) Authentication: "'

alias pm='sudo pacman'
alias syu='sudo pacman -Syu'
alias df='df -h'
alias du='du -h -c'
alias free='free -h'
alias dmesg='sudo dmesg'

alias reboot='systemctl reboot'
alias poweroff='systemctl poweroff'
alias enable='systemctl enable'
alias disable='systemctl disable'
alias start='systemctl start'
alias stop='systemctl stop'
alias reload='systemctl reload'
alias restart='systemctl restart'
alias status='systemctl status'

ftc(){
    [[ -f /usr/share/doc/find-the-command/ftc.bash ]] && . /usr/share/doc/find-the-command/ftc.bash
    $1
}

debian(){
    local _CON_TERM="xterm-256color"
    local _CON_MAIN_DIR="${HOME}/vms/containers"
    local _CON_SYS="debian-sid"
    local _CON_USER="mmc0"
    local _CON_HOST="localhost"

#   echo "Terminal   :${_CON_TERM}"
    echo "Systemd-nspawn Container Manager"
    echo ""
    echo "Sys : ${_CON_SYS}"
    echo "User: ${_CON_USER}"
    echo "Host: ${_CON_HOST}"

    echo "Request sudo promission..."
    sudo systemd-nspawn\
        --background=\
        --setenv=TERM="${_CON_TERM}"\
        --hostname ${_CON_HOST}\
        --user=${_CON_USER}\
        --directory ${_CON_MAIN_DIR}/${_CON_SYS}/

}

cleanup(){
    echo "Doing clean..."
    
    df -h /
    echo "Removing pacman package cache..."
    echo "Request sudo promission..."
    yes | sudo pacman -Scc
    df -h /

    df -h /home
    echo "Removing ~/.cache ..."
    rm -rf ~/.cache
    mkdir -p ~/.cache/mpd
    mkdir -p ~/.cache/minecraft
    df -h /home
    echo "Completed!"
}
