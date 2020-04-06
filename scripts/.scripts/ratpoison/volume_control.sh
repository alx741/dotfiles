#! /bin/sh

$(dirname "$0")/../volume.sh "$1"

ratpoison -c "echo $($(dirname "$0")/../volume.sh info)"
tmux refresh-client -S
