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
alias ,pi='~/pkg/iso'
alias ,.c='~/.config/'

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

# Edit/Source configs
alias virc='$EDITOR ~/.bashrc'
alias vipf='$EDITOR ~/.profile'
alias vialias='$EDITOR ~/.config/shell/aliases.sh'
alias viprompt='$EDITOR ~/.config/shell/prompt.sh'
alias vikitty='$EDITOR ~/.config/kitty/kitty.conf'
alias visway='$EDITOR ~/.config/sway/config'
alias vidiary='$EDITOR ~/doc/diary/$(date +%Y-%m-%d.txt)'

alias srpf='. ~/.profile'
alias srrc='. ~/.bashrc'

# SSH
alias sshfedora='ssh takeuper@192.168.122.228'
alias sshfedora-kitty='kitty +kitten ssh takeuper@192.168.122.228'

# Else
alias n='ncmpcpp'
alias c='clear'
alias y='yazi'
alias ff='fastfetch --logo none'
alias vim='nvim'

# System
alias sudo='sudo -p "[sudo] (%u to %U) Authentication: "'

alias syu='sudo pacman -Syu'
alias df='df -h'
alias du='du -h -c'
alias free='free -h'
alias lsblk='lsblk -o NAME,RM,TYPE,SIZE,MOUNTPOINTS,TRAN,MODEL'

alias reboot='systemctl reboot'
alias poweroff='systemctl poweroff'
alias enable='systemctl enable'
alias disable='systemctl disable'
alias start='systemctl start'
alias stop='systemctl stop'
alias reload='systemctl reload'
alias restart='systemctl restart'
alias status='systemctl status'
