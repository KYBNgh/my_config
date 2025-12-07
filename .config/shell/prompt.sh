# ~/.config/shell/prompt.sh
#
# Base on https://github.com/gnuunixchad/dotfiles/blob/master/.bashrc
#
# Original copyright notice:
# @author nate zhou
# @since 2023,2024,2025
#
# Modifications by KYBNgh: 
# Prompt like:
# 130 foo@bar-host repo master *= $ 
# Blue '@' sign and exit code in front of prompt
# Blue '>>' in PS2

GIT_PS1_SHOWDIRTYSTATE=1        # + for staged, * if unstaged
GIT_PS1_SHOWSTASHSTATE=1        # $ if something is stashed.
GIT_PS1_SHOWUNTRACKEDFILES=1    # % if there are untracked files
GIT_PS1_SHOWUPSTREAM=1 	        # <, >, <> behind, ahead, or diverged from upstream.
GIT_PS1_STATESEPARATOR=" " 	# separator between branch name and state symbols
GIT_PS1_DESCRIBE_STYLE=1 	# show commit relative to tag or branch, when detached HEAD
GIT_PS1_SHOWCOLORHINTS=1        # display in color

PS1='$(EXIT_CODE=$?; if [ $EXIT_CODE -ne 0 ]; then echo "\[\033[1;38;5;15m\]$EXIT_CODE \[\033[0m\]";fi)\[\033[38;5;15m\]\u\[\033[0m\]\[\033[1;38;5;4m\]@\[\033[0m\]\[\033[38;5;15m\]\h\[\033[0m\]\[\033[1;38;5;4m\] \W\[\033[0m\]\[\033[1;38;5;15m\]$(__git_ps1 " %s") \$\[\033[0m\] '
PS2='\[\033[1;38;5;4m\]>>\[\033[0m\] '
