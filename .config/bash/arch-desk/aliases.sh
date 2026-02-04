# ~/.config/bash/arch-desk/aliases.sh
# Aliases for arch-desk
#
# Original copyright notice:
# @author nate zhou
# @since 2023,2024,2025
# aliases for bash for arch-desk machine
#
# Modifications by @KYBNgh

# Change directory
alias ,da='~/data'
alias ,d='~/dls'
alias ,D='~/doc'
alias ,m='~/mus'
alias ,V='~/vid'
alias ,v='~/vms'
alias ,t='~/tmp'
alias ,g='~/git'
alias ,gc='~/git/my_config'
alias ,gl='~/git/my_linux'
alias ,.c='~/.config/'

# Edit/Source configs
alias vialias='vim ${BASH_CONFIG}/arch-desk/aliases.sh'
alias viprompt='vim ${BASH_CONFIG}/arch-desk/prompt.sh'
alias visway='vim ~/.config/sway/config'
alias vidiary='vim ~/doc/personal/diary/$(date +%Y-%m-%d.txt)'

# Else
alias n='ncmpcpp'
alias r='ranger'
alias icat='kitten icat'
alias wsk="wshowkeys -a bottom -F 'SourceCodePro 30' -l 60 &"
alias qwen-run='ollama run qwen3:8b'
alias qwen-stop='ollama stop qwen3:8b'

# System
alias sudo='sudo -p "[sudo] (%u to %U) Authentication: "'
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
