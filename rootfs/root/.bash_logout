# /root/.bash_logout

if [ $(id -u) = "0" ]; then
    rm -f $HOME/.bash_history $HOME/.viminfo $HOME/.cache $HOME/.ssh $HOME/.local $HOME/.lesshst
fi
