# Aliases for Termux

alias vialias='vim ${BASH_CONFIG}/arch-desk/aliases.sh'
alias viprompt='vim ${BASH_CONFIG}/arch-desk/prompt.sh'

alias sshpc='ssh arch'
alias sync-doc='rsync -av --exclude="containers" arch:/home/mmc0/doc/ ~/doc'

dev()
{
    local toybox="/system/bin"
    local base="/data/data/com.termux"
    ${toybox}/mv ${base}/files ${base}/files-main
    ${toybox}/mv ${base}/files-dev ${base}/files
    pkill -9 com.termux
}

tmoe()
{
    local toybox="/system/bin"
    local base="/data/data/com.termux"
    ${toybox}/mv ${base}/files ${base}/files-main
    ${toybox}/mv ${base}/files-tmoe ${base}/files
    pkill -9 com.termux
}
