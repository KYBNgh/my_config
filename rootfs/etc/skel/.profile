# User's profile.
# ~/.profile

# Set your favorite editor
EDITOR=vi ; export EDITOR
PAGER=less ; export PAGER

# Source user's bashrc
if [ -f $HOME/.bashrc ]; then
    . $HOME/.bashrc
fi
