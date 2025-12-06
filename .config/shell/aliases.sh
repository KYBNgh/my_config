# Aliases for ls
alias l='ls --color=auto'
alias ls='ls -F --color=auto --group-directories-first'
alias ll="ls -lh --time-style=long-iso"
alias la="ls -A"
alias lla="ls -lhA --time-style=long-iso"
alias l.="ls -d .*"
alias ll.="ls -lh -d --time-style=long-iso .*"
alias lt="ls -lt --time-style=long-iso"
alias lw="ls -ldh $(pwd)"
alias lss='du -sh .[^.]* .[!.]* * 2>/dev/null | sort -hr'
# Aliases for color
alias grep='grep --color=auto'
alias ip='ip -color=auto'

# Aliases for file
alias md='mkdir'
alias rd='rmdir'
alias rm='rm -I'

# Aliases for system
alias df='df -h'
alias free='free --si -h'
alias du='du -h -c'
alias reboot='systemctl reboot -i'
alias poweroff='systemctl poweroff'
alias syu='sudo pacman -Syu'

# Aliases for edit, source dotfiles
alias virc='$EDITOR ~/.bashrc'
alias vialias='$EDITOR ~/.config/shell/aliases.sh'
alias viprofile='$EDITOR ~/.profile'
alias visway='$EDITOR ~/.config/sway/config'
alias vikitty='$EDITOR ~/.config/kitty/kitty.conf'
alias srprofile='. ~/.profile'
alias srrc='. ~/.bashrc'

# Aliases for quick
alias ff='fastfetch --logo none'
alias n='ncmpcpp'
alias c='clear'
alias y='yazi'
alias vim='nvim'
alias sshdeb='ssh -p 2222 -i ~/.ssh/id_ed25519 levalwe@192.168.1.9'
