## My Config
This is my Arch Linux config including shell(bashrc, profile, inputrc, ...), neovim and kitty.
I am writing a bash script to one-click deployment. It can works in Termux, too. But the script is a half-finished product.

## Usage[Temporary]
Once I finish my script, you can run the script. You can do it manually:

1. Backup your config now.

2. Clone this repo
```sh
# Make repo dir [Optional]
mkdir ~/git
cd ~/git

# Then clone it
git clone https://github.com/KYBNgh/my_config.git ~/git/
```
3. Create symlinks
```sh
# For nvim and kitty
ln -s ~/git/my_config/.config/nvim ~/.config/nvim
ln -s ~/git/my_config/.config/kitty ~/.config/kitty

# For shell
ln -s ~/git/my_config/.config/shell ~/.config/shell
ln -s ~/.config/shell/bashrc.sh ~/.bashrc
ln -s ~/.config/shell/profile.sh ~/.profile
ln -s ~/.config/shell/inputrc ~/.inputrc
```
4. Reload your bash, kitty and nvim
For kitty and nvim, just turn off them and turn on them again
```sh
# Source, it will source bashrc too
source ~/.profile
```
