# ~/.config/firejail/hmcl.profile
include /etc/firejail/allow-java.inc 
include /etc/firejail/disable-common.inc

whitelist ${HOME}/.hmcl
whitelist ${HOME}/.java
whitelist ${HOME}/.local/share/hmcl
whitelist ${HOME}/.local/share/_hmcl
whitelist ${HOME}/.local/share/java
whitelist ${HOME}/.local/share/openjfx
whitelist ${HOME}/.cache/minecraft
whitelist ${HOME}/.local/games
# whitelist ${RUNUSER}/bus
# whitelist ${RUNUSER}/at-spi

# Access cursor theme
whitelist ${HOME}/.local/share/themes
whitelist ${HOME}/.local/share/icons

netfilter

env GTK_THEME=Reversal-Dark:dark

caps.drop all
seccomp 

nogroups
nodvd
nonewprivs
noroot
