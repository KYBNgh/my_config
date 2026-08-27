# ~/.config/firejail/opencode-loopback.profile

noblacklist ${HOME}/.config/opencode
noblacklist ${HOME}/.local/share/opencode

mkdir ${HOME}/.config/opencode
mkdir ${HOME}/.local/share/opencode

blacklist ${HOME}/.ssh
blacklist ${HOME}/.npm
blacklist ${HOME}/.gnupg
blacklist ${HOME}/.local/share/gnupg
blacklist ${HOME}/.config/gnupg

blacklist ${HOME}/.pki
blacklist ${HOME}/.local/share/keyrings
blacklist ${HOME}/.gnome/keyrings
blacklist ${HOME}/.aws
blacklist ${HOME}/.kube
blacklist ${HOME}/.docker

read-only ${HOME}/.local/app/opencode

# protocol unix,inet,inet6

nodbus
caps.drop all
seccomp
nonewprivs
noroot
ipc-namespace

private-dev
private-tmp

