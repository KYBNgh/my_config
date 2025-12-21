# Source ~/.bashrc
if [ -f ~/.bashrc ]; then
     . ~/.bashrc
fi

# Set PATH
export PATH="${HOME}/.local/bin:$PATH"

# Set EDITOR: prefer nvim > vim > (empty)
if command -v nvim >/dev/null 2>&1; then
    export EDITOR=nvim
elif command -v vim >/dev/null 2>&1; then
    export EDITOR=vim
else
    export EDITOR=
fi

# Set PAGER: prefer bat > less > (empty)
if command -v bat >/dev/null 2>&1; then
    export PAGER=bat
elif command -v less >/dev/null 2>&1; then
    export PAGER=less
else
    export PAGER=
fi

export LESS="-R -F -X" 
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# Set Proxy
#export http_proxy="http://192.168.1.8:8080"
#export https_proxy=$http_proxy
#export ftp_proxy="http://192.168.1.8:8080"
#export no_proxy="localhost,127.0.0.1,.local"
