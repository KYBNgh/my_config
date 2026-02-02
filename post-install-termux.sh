#!/bin/bash
# post install script for termux

# Packages to remove
PURGE_PKG='nano ed'

# Packages to install
# Editor, vim or neovim
INSTALL_PKG='neovim '
# Shell extra
INSTALL_PKG+='bash-completion '
# Dotfiles manager
INSTALL_PKG+='git stow '
# SSH and synchronizing
INSTALL_PKG+='openssh rsync '
# Other utils
INSTALL_PKG+='fzf bat which tree unzip termux-api '
# Add more ...
# INSTALL_PKG+='<your packages> '

# New directories to make in ~
NEW_DIRS='git doc '
# Add more ...
# NEW_DIRS+='<your directories> '


# Upgrade
termux-setup-storage
sed -i 's@packages.termux.org@mirrors.ustc.edu.cn/termux@' $PREFIX/etc/apt/sources.list
apt update

# Forcing upgrade, answer 'y'
yes | apt  upgrade 

# Change back source list which change by foring upgrade
sed -i 's@packages.termux.org@mirrors.ustc.edu.cn/termux@' $PREFIX/etc/apt/sources.list

# Remove packages
apt purge -y ${PURGE_PKG}

# Install packages
apt install -y ${INSTALL_PKG}

# Change motd
chmod +x $PREFIX/etc/motd.sh
rm -fv $PREFIX/etc{motd,motd-playstore}
echo '$PREFIX/etc/motd.sh' >> $PREFIX/etc/termux-login.sh

# Remove default symbolic links
for i in $(ls ~/storage); do
    unlink ~/storage/$i
done
unset i

# Make directory and symbolic links
for i in ${NEW_DIRS}; do
    mkdir -v ~/$i
done
unset i

# ln -s <source_directory> <target>
# ln -s foo bar
# Create symlink bar -> foo
MAIN='/storage/emulated/0'

for mapping in \
    "Download:dls" \
    "Music:mus" \
    "Pictures:pic" 
do
    src="${mapping%:*}"
    dst="${mapping#*:}"
    
    if [[ -d "$MAIN/$src" ]]; then
        ln -sfn "$MAIN/$src" "$HOME/$dst"
        echo "$src -> $dst"
    else
        echo "$src do not exist, skipped"
    fi
done

# Clone repo
# DOTFILES_URL='https://github.com/KYBNgh/my_config.git'
# git clone ${DOTFILES_URL} ~/git

DOTFILES_DIR="$HOME/git/my_config/"
cd $DOTFILES_DIR
./install.sh
