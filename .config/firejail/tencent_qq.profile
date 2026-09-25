# ~/.config/firejail/hmcl.profile
include /etc/firejail/disable-common.inc

private ${HOME}/.local/jails/tencent_qq
private-dev
noblacklist /dev/fuse

netfilter

env GTK_THEME=Reversal-Dark:dark
env XMODIFIERS="@im=fcitx"
env GTK_IM_MODULE=fcitx
env QT_IM_MODULE=fcitx
env SDL_IM_MODULE=fcitx
env GDK_SCALE=1.5

# caps.drop all
# seccomp 

nogroups
nodvd
nonewprivs
noroot
