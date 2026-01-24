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

# Edit/Source configs
alias vialias='vim ${BASH_CONFIG}/arch-desk/aliases.sh'
alias viprompt='vim ${BASH_CONFIG}/arch-desk/prompt.sh'
alias visway='vim ~/.config/sway/config'
alias vidiary='vim ~/doc/personal/diary/$(date +%Y-%m-%d.txt)'

# Else
alias n='ncmpcpp'
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

ftc(){
    [[ -f /usr/share/doc/find-the-command/ftc.bash ]] && . /usr/share/doc/find-the-command/ftc.bash
    $1
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
