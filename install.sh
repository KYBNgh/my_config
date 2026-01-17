#!/bin/bash
# config install script
#

info(){
    echo "[INFO] $1"
} 

if [ "$PREFIX" = /data/data/com.termux/files/usr ]; then
    info "Environment: Termux"
    IS_TERMUX=true
else
    info "Environment: GNU/Linux or else"
fi

info "PWD: `pwd`"
echo -n "Do you want to continue? (y/n)"
read -n 1 YN
case $YN in
    [Yy])
        info "Running command: stow -t . ~"
        stow -t . ~

        if [ "${IS_TERMUX}" = "true" ]; then
        info "Creating symlink for inputrc"
        ln -v -s ${HOME}/.config/readline/inputrc ${HOME}/.inputrc
        else
        info "Removing termux links"
        unlink -v ~/.termux
        
        fi
        ;;
    * )
        echo 
        echo "Cancle by user, exiting..."
        exit 1
        ;;
esac
