# /root/.profile

EDITOR=vi ; export EDITOR
PAGER=less ; export PAGER

if [ -f $HOME/.bashrc ]; then
    . $HOME/.bashrc
fi
