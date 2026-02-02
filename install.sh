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
info "If you want to undo, type 'stow -D -t ~ .'"
read -p "Do you want to continue? (y/n) " -n 1 YN
case $YN in
    [Yy])
        info "Running command: stow -t ~ . --adopt"
        stow -t ~ . --adopt

        if [ "${IS_TERMUX}" = "true" ]; then
        info "Creating symlink for inputrc"
        ln -v -s ${HOME}/.config/readline/inputrc ${HOME}/.inputrc
        else
        info "Removing termux links"
        unlink ~/.termux
        fi
        ;;
    * )
        echo 
        echo "Cancle by user, exiting..."
        exit 1
        ;;
esac
