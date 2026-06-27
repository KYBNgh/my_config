# User's Bourne-Again Shell configuration.
# ~/.bashrc

# Check shell options.
# for non-interactive shell, don't do anything.
case $- in
*i*) ;;
*) return ;;
esac

# Get gobal aliases and functions.
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Set a umask
# Dir: drwxr-x---
# File: -rw-r-----
umask 027

# User specific aliases.
alias ls='ls --color=auto -F'
alias ll='ls -lh'
alias la='ls -A'

# Add more aliases.
if [ -f ~/.bash.aliases ]; then
	. ~/.bash.aliases
fi

# History
HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=10000
HISTIGNORE="cd:ls:ll:la"

# Prompt
PS1='(\u@\h):\w> '

command_not_found_handle() {
	echo "bash: command not found..."
	if [ -f "/usr/share/doc/pkgfile/command-not-found.bash" ]; then 
		. /usr/share/doc/pkgfile/command-not-found.bash && "$@"
	else
		return 127
	fi
}
