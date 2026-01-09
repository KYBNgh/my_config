# Source ~/.bashrc
if [ -f ~/.bashrc ]; then
     . ~/.bashrc
fi

# Set PATH

export PATH="${HOME}/.local/bin:$PATH"

if [ "$PREFIX" == /data/data/com.termux/files/usr ]; then
    export PATH="${PATH}:/system/bin"
else
    export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
    export LESSHISTFILE="$XDG_DATA_HOME/less/less_history"
fi


# Set EDITOR: prefer nvim > vim > (empty)
if command -v nvim >/dev/null 2>&1; then
    export EDITOR=nvim
elif command -v vim >/dev/null 2>&1; then
    export EDITOR=vim
fi

# Set PAGER: prefer bat > less > (empty)
if command -v bat >/dev/null 2>&1; then
    export PAGER=bat
elif command -v less >/dev/null 2>&1; then
    export PAGER=less
fi

export LESS="-R -F -X" 
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BROWSER="zen"



# Set Proxy
#export http_proxy="http://192.168.1.8:8080"
#export https_proxy=$http_proxy
#export ftp_proxy="http://192.168.1.8:8080"
#export no_proxy="localhost,127.0.0.1,.local"
