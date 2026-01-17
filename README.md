## License
This my_config repository is licensed under the **GNU General Public License v3.0**

It incorporates code from:

- [unixchad dotfiles on github](https://github.com/gnuunixchad/dotfiles)(GPL-3.0)

Orginal author is:
- [gnuunixchad](https://github.com/gnuunixchad/)

## My Config
This is my Arch Linux config including shell(bashrc, profile, inputrc, ...), neovim and kitty. A part of it comes from @gnuunixchad.
I am writing a bash script to one-click deployment. It can works in Termux, too. But the script is a half-finished product.

## Usage[Temporary]
Once I finish my script, you can run the script. You can do it manually:

1. Backup your config

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
stow -t ~ .
```

4. Undo
if you regret, cd to this repo
```sh
cd ~/git/my_config/
stow -D -t ~ .

# rm this repo
cd ..
rm -rf my_config
```
