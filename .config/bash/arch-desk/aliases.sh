# ~/.config/bash/arch-desk/aliases.sh
# Aliases for arch-desk
#
# Original copyright notice:
# @author nate zhou
# @since 2023,2024,2025
# aliases for bash for arch-desk machine
#
# Modifications by @KYBNgh

# Else
alias n='ncmpcpp'
alias icat='kitten icat'
alias lb='lsblk -o NAME,SIZE,TYPE,FSTYPE,MOUNTPOINTS'
alias si='swayimg'
alias lfcd='$(lf -print-last-dir )'
alias wsk="wshowkeys -a bottom -F 'SourceCodePro 30' -l 60 &"

# System
alias dmesg='doas dmesg'
