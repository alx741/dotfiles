#! /bin/sh

current_song=$(mpc current)

ratpoison -c "echo <Music> $current_song"
