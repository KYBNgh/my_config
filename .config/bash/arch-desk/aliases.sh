# ~/.config/bash/arch-desk/aliases.sh
# Aliases for arch-desk
#
# Original copyright notice:
# @author nate zhou
# @since 2023,2024,2025
# aliases for bash for arch-desk machine
#
# Modifications by @KYBNgh

# Edit/Source configs
alias vialias='vim ${BASH_CONFIG}/arch-desk/aliases.sh'
alias viprompt='vim ${BASH_CONFIG}/arch-desk/prompt.sh'
alias visway='vim ~/.config/sway/config'
alias vidiary='vim ~/doc/personal/diary/$(date +%Y-%m-%d.txt)'

# Else
alias n='ncmpcpp'
alias icat='kitten icat'
alias lb='lsblk -o NAME,SIZE,TYPE,FSTYPE,MOUNTPOINTS'
alias si='swayimg'
alias lfcd='$(lf -print-last-dir )'
alias wsk="wshowkeys -a bottom -F 'SourceCodePro 30' -l 60 &"

# System
alias dmesg='doas dmesg'
