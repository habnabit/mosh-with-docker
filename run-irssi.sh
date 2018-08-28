#!/bin/sh
exec "$(dirname $0)/run-mosh-server-ubuntu-exterior.sh" \
    --mount "type=volume,src=irssi-perl5,dst=/home/mosh-user/perl5" \
    --mount "type=bind,src=$(dirname $0)/sockets,dst=/sockets" \
    --mount "type=bind,src=$HOME/.irssi,dst=/home/mosh-user/.irssi" \
    --mount "type=bind,src=$HOME/.dotfiles,dst=/home/mosh-user/.dotfiles" \
    -e "TMUX_TMPDIR=/sockets" \
    --rm --network test-net \
    mosh-server-ubuntu-irssi \
    sh -c 'mkdir ~/.ssh && ~/.dotfiles/install.py && rm -f /tmp/mosh-key && exec /bin/zsh'
