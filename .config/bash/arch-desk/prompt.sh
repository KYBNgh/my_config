# ~/.config/bash/arch-desk/prompt.sh
# Bash prompt for arch-desk
#
# Original copyright notice:
# @author nate zhou
# @since 2023,2024,2025
#
# Modifications by @KYBNgh
# Prompt:
# 130 foo@bar-host repo master *= $ 
# Blue and green '@' sign and exit code in front of prompt
# Blue and green '>>' in PS2

# Source git prompt
[[ -f "/usr/share/git/completion/git-prompt.sh" ]] && . /usr/share/git/completion/git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=1        # + for staged, * if unstaged
GIT_PS1_SHOWSTASHSTATE=1        # $ if something is stashed.
GIT_PS1_SHOWUNTRACKEDFILES=1    # % if there are untracked files
GIT_PS1_SHOWUPSTREAM=1 	        # <, >, <> behind, ahead, or diverged from upstream.
GIT_PS1_STATESEPARATOR=" " 	# separator between branch name and state symbols
GIT_PS1_DESCRIBE_STYLE=1 	# show commit relative to tag or branch, when detached HEAD
GIT_PS1_SHOWCOLORHINTS=1        # display in color

    if [ ! $UID -eq 0 ]; then
        if [ -n "$SSH_CONNECTION" ]; then
	        PS1='$(EXIT_CODE=$?; if [[ $EXIT_CODE -ne 0 && $EXIT_CODE -ne 130 ]]; then echo "\[\033[1;38;5;15m\]$EXIT_CODE \[\033[0m\]";fi)\[\033[38;5;15m\]\u\[\033[0m\]\[\033[1;38;5;3m\]@\[\033[0m\]\[\033[38;5;15m\]\h\[\033[0m\]\[\033[1;38;5;3m\] \W\[\033[0m\]\[\033[1;38;5;15m\]$(__git_ps1 " %s") \$\[\033[0m\] '
            PS2='\[\033[1;38;5;3m\]>>\[\033[0m\] '
        else
            PS1='$(EXIT_CODE=$?; if [[ $EXIT_CODE -ne 0 && $EXIT_CODE -ne 130 ]]; then echo "\[\033[1;38;5;15m\]$EXIT_CODE \[\033[0m\]";fi)\[\033[38;5;15m\]\u\[\033[0m\]\[\033[1;38;5;4m\]@\[\033[0m\]\[\033[38;5;15m\]\h\[\033[0m\]\[\033[1;38;5;4m\] \W\[\033[0m\]\[\033[1;38;5;15m\]$(__git_ps1 " %s") \$\[\033[0m\] '
        PS2='\[\033[1;38;5;4m\]>>\[\033[0m\] '
        fi
    else
        PS1='$(EXIT_CODE=$?; if [ $EXIT_CODE -ne 0 ]; then echo "\[\033[1;38;5;15m\]$EXIT_CODE \[\033[0m\]";fi)\[\033[30;107m\]\u@\h\[\033[00;00m\] \[\033[01;40m\]\W$(__git_ps1 " %s") \$\[\033[00;00m\] '
        PS2='\[\033[01;40m\]>>\[\033[0m\] '
        fi

