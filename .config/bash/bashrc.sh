### check shell ###
case $- in
    *i*) ;;
      *) return;;
esac


### basic ###
shopt -s histappend
shopt -s checkwinsize
shopt -s autocd
shopt -s globstar
HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=10000

set -o vi
bind -m vi-insert "\C-l":clear-screen
printf '\e[5 q'

### bash-completion, aliases, functions ###
if [ -f /usr/share/bash-completion/bash_completion ]; then 
. /usr/share/bash-completion/bash_completion 
elif [ -f /etc/bash_completion ]; then 
. /etc/bash_completion 
fi

[[ -f ~/.config/bash/aliases.sh   ]] && source ~/.config/bash/aliases.sh
[[ -f ~/.config/bash/functions.sh ]] && source ~/.config/bash/functions.sh

[[ -f ~/.config/bash/prompt.sh    ]] && source ~/.config/bash/prompt.sh

