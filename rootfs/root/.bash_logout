# /root/.bash_logout
# root is not for daily use
# kill its tmp files and ssh key, not use it to login

if [ $(id -u) = "0" ] && [ "$HOME" = "/root" ]; then
    rm -rf $HOME/.bash_history \
        $HOME/.lesshst \
        $HOME/.viminfo \
        $HOME/.cache \
        $HOME/.ssh \
        $HOME/.local \
        $HOME/.config
fi
