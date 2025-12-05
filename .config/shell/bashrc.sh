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
# printf '\e[5 q'

### bash-completion, aliases, functions ###
if [ -f /usr/share/bash-completion/bash_completion ]; then 
. /usr/share/bash-completion/bash_completion 
elif [ -f /etc/bash_completion ]; then 
. /etc/bash_completion 
fi

# [[ -f /usr/share/doc/find-the-command/ftc.bash ]] && source /usr/share/doc/find-the-command/ftc.bash

[[ -f ~/.config/shell/aliases.sh   ]] && source ~/.config/shell/aliases.sh
[[ -f ~/.config/shell/functions.sh ]] && source ~/.config/shell/functions.sh
[[ -f ~/.config/shell/prompt.sh    ]] && source ~/.config/shell/prompt.sh

#export http_proxy="http://192.168.1.8:8080"
#export https_proxy="http://192.168.1.8:8080"
#export ftp_proxy="http://192.168.1.8:8080"
#export no_proxy="localhost,127.0.0.1,.local"
