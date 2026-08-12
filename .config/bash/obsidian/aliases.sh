# ~/.config/bash/multi/aliases.sh
#
# Original copyright notice:
# @author nate zhou
# @since 2023,2024,2025
# aliases for bash for arch-desk machine
#
# Modifications by @KYBNgh

alias n='ncmpcpp'
alias icat='kitten icat'
alias lb='lsblk -o NAME,SIZE,TYPE,FSTYPE,MOUNTPOINTS'
alias si='swayimg'
alias lfcd='$(lf -print-last-dir )'
alias qe='pacman -Qe --color=always | less'
alias qm='pacman -Qm --color=always | less'
alias qn='pacman -Qe --color=always | less'

# System
alias dmesg='doas dmesg'
