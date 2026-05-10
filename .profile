# ~/.profile
# @KYBNgh

# Set PATH
# Add user's private bin(scripts)
if [ -d "${HOME}/.local/bin" ]; then
    export PATH="${HOME}/.local/bin:${PATH}"
fi

# Add user's private Appimage
if [ -d "${HOME}/.local/app" ]; then
    export PATH="${HOME}/.local/app:${PATH}"
fi

# For Termux, add /system/bin
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

# Set vim config dirctory
if [ "$EDITOR" = "vim" ]; then
    export VIMINIT='source ~/.config/vim/vimrc'
    export VIMCONFIG=~/.config/vim
fi

# XDG's dirctories
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CONFIG_HOME="${HOME}/.config"
export BROWSER="firefox"

export PAGER=less
export LESS="-R -i -F -X -M -S"
export LESSHISTFILE="$XDG_DATA_HOME/less/less_history"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"

# Man page
[ -x /usr/bin/bat ] && export MANROFFOPT="-c" && export MANPAGER="sh -c 'col -bx | bat --pager \"less -XR\" -l man -p'"

# Source bashrc
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Set Proxy, as a fuintion
proxy-up() {
    export http_proxy="http://192.168.31.20:8080"
    export https_proxy=$http_proxy
    export ftp_proxy="http://192.168.31.20:8080"
    export no_proxy="localhost,127.0.0.1,.local"
}

proxy-down() {
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset no_proxy
}

# Start sway session in TTY
if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec sway
fi
