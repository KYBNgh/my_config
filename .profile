# ~/.profile
# @KYBNgh

# Set Termux flags
if [ -v TERMUX_VERSION ]; then
    export is_termux=true
fi

# Set PATH
# Add user's private bin(scripts)
if [ -d "${HOME}/.local/bin" ]; then
    export PATH="${HOME}/.local/bin:${PATH}"
fi

# Add user's private Appimage
if [ -d "${HOME}/.local/app" ]; then
    export PATH="${HOME}/.local/app:${PATH}"
fi

# Add android bin and customize dgobal bin for Termux
if [ -v is_termux ]; then
    if [ -d "/data/data/com.termux/bin" ]; then export PATH="${PATH}:/data/data/com.termux/bin:/system/bin" ; fi
    export PATH="${PATH}:/system/bin"
fi

export EDITOR=vim

# XDG dirctories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_HOME="$HOME/.local/share"

export XDG_DOWNLOAD_DIR="$HOME/dls"
export XDG_DOCUMENTS_DIR="$HOME/doc"
export XDG_MUSIC_DIR="$HOME/mus"
export XDG_PICTURES_DIR="$HOME/pic"
export XDG_VIDEOS_DIR="$HOME/vid"

export PAGER=less
export LESS="-R -i -F -X -M -S"
export LESSHISTFILE="$XDG_CACHE_HOME/less_history"
export CALCHISTFILE="$XDG_CACHE_HOME/calc_history"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export BROWSER="firefox"

export ZDOTDIR="$XDG_CONFIG_HOME"/zsh

# Man page
[ -x /usr/bin/bat ] && export MANROFFOPT="-c" && export MANPAGER="sh -c 'col -bx | bat --pager \"less -XR\" -l man -p'"

# Source bashrc
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
   exec sway
fi
