#! /bin/sh

current_song=$(mpc current)

ratpoison -c "echo $current_song"
