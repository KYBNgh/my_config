# ~/.config/firejail/hmcl.profile
include /etc/firejail/allow-java.inc 
include /etc/firejail/disable-common.inc

private ${HOME}/.local/games

netfilter

env GTK_THEME=Reversal-Dark:dark
env XMODIFIERS="@im=fcitx"
env GTK_IM_MODULE=fcitx
env QT_IM_MODULE=fcitx
env SDL_IM_MODULE=fcitx

caps.drop all
seccomp 

nogroups
nodvd
nonewprivs
noroot
