# ~/.profile
# @KYBNgh
# Source ~/.bashrc

# Set PATH
# Add user's private bin
if [ -d "${HOME}/.local/bin" ]; then
    export PATH="${HOME}/.local/bin:${PATH}"
fi

# For Termux, add system bin
if [ "$PREFIX" = "/data/data/com.termux/files/usr" ]; then
    if [ -d "/data/data/com.termux/bin" ]; then
        export PATH="${PATH}:/data/data/com.termux/bin:/system/bin"
    else
        export PATH="${PATH}:/system/bin"
    fi
fi

# Set EDITOR: prefer nvim > vim
if command -v nvim >/dev/null 2>&1; then
    export EDITOR=nvim
elif command -v vim >/dev/null 2>&1; then
    export EDITOR=vim
fi

# Set PAGER: prefer bat > less
if command -v bat >/dev/null 2>&1; then
    export PAGER=bat
elif command -v less >/dev/null 2>&1; then
    export PAGER=less
fi

# If terminal is foot, set it to xterm-256color
if [ "$TERM" = "foot" ]; then
    export TERM=xterm-256color
fi

# XDG's
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CONFIG_HOME="${HOME}/.config"

export LESSHISTFILE="$XDG_DATA_HOME/less/less_history"

export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export LESS="-R -F -X" 
export BROWSER="firefox"

# export LIBVIRT_DEFAULT_URI=qemu:///system

[ -x /usr/bin/bat ] && export MANROFFOPT="-c" && export MANPAGER="sh -c 'col -bx | bat --pager \"less -XR\" -l man -p'"

if [ -f ~/.bashrc ]; then
     . ~/.bashrc
fi

# Set Proxy
#export http_proxy="http://192.168.31.20:8080"
#export https_proxy=$http_proxy
#export ftp_proxy="http://192.168.31.20:8080"
#export no_proxy="localhost,127.0.0.1,.local"

# Start sway session in TTY
if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
   sway
fi
