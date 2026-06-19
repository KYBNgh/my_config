# ~/.config/firejail/hmcl.profile
include /etc/firejail/allow-java.inc 
include /etc/firejail/disable-common.inc

private ${HOME}/.local/games

netfilter

env GTK_THEME=Reversal-Dark:dark

caps.drop all
seccomp 

nogroups
nodvd
nonewprivs
noroot
