# profile
# @KYBNgh
# Source ~/.bashrc

# Set PATH
export PATH="${HOME}/.local/bin:$PATH"


if [ "$PREFIX" == /data/data/com.termux/files/usr ]; then
    export PATH="${PATH}:/system/bin"
fi

export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export LESSHISTFILE="$XDG_DATA_HOME/less/less_history"

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

export XDG_CONFIG_HOME="${HOME}/.config"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export LESS="-R -F -X" 
export BROWSER="firefox"

[ -x /usr/bin/bat ] && export MANROFFOPT="-c" && export MANPAGER="sh -c 'col -bx | bat --pager \"less -XR\" -l man -p'"

if [ -f ~/.bashrc ]; then
     . ~/.bashrc
fi

# Start sway session in tty
if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
   exec sway
fi
# Set Proxy
#export http_proxy="http://192.168.1.8:8080"
#export https_proxy=$http_proxy
#export ftp_proxy="http://192.168.1.8:8080"
#export no_proxy="localhost,127.0.0.1,.local"
