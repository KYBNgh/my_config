# ~/.config/firejail/hmcl.profile
include /etc/firejail/allow-java.inc 

# noblacklist ${HOME}/
noblacklist ${HOME}/.hmcl
noblacklist ${HOME}/.java
noblacklist ${HOME}/.local/share/hmcl
noblacklist ${HOME}/.local/share/_hmcl
noblacklist ${HOME}/.local/share/java
noblacklist ${HOME}/.local/share/openjfx
noblacklist ${HOME}/.cache/minecraft

noblacklist ${HOME}/.config/gtk-2.0
noblacklist ${HOME}/.config/gtk-3.0
noblacklist ${HOME}/.config/gtk-4.0
noblacklist ${HOME}/.config/dconf


noblacklist ${HOME}/.local/share/themes
noblacklist ${HOME}/.local/share/icons
noblacklist /usr/lib/jvm/
noblacklist /usr/bin/java
noblacklist /tmp/.X11-unix
noblacklist ${HOME}/.local/games
noblacklist /run/user/1000/bus
noblacklist /run/user/1000/at-spi
noblacklist /dev/dri
noblacklist /dev/null


whitelist /dev/null
whitelist ${HOME}/.config/dconf
whitelist /dev/dri
whitelist /tmp/.X11-unix

whitelist ${HOME}/.hmcl
whitelist ${HOME}/.java
whitelist ${HOME}/.local/share/hmcl
whitelist ${HOME}/.local/share/_hmcl
whitelist ${HOME}/.local/share/java
whitelist ${HOME}/.local/share/openjfx
whitelist ${HOME}/.cache/minecraft
whitelist ${HOME}/.local/games
whitelist /run/user/1000/bus
whitelist /run/user/1000/at-spi

# Access cursor theme
whitelist ${HOME}/.local/share/themes
whitelist ${HOME}/.local/share/icons

netfilter
seccomp

env GTK2_RC_FILES=${HOME}/.config/gtk-2.0/gtkrc
env GTK_THEME=Reversal-Dark:dark
dbus-user.talk org.freedesktop.impl.portal.Settings
