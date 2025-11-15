if [ -f ~/.bashrc ]; then
     source ~/.bashrc
fi


export EDITOR=nvim
export PATH="${HOME}/.local/bin:$PATH"

export http_proxy="http://192.168.1.8:8080"
export https_proxy=$http_proxy
export ftp_proxy="http://192.168.1.8:8080"
export no_proxy="localhost,127.0.0.1,.local"
