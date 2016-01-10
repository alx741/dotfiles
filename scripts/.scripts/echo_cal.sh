#! /bin/sh

day=$(date "+%_d" | tr -d " ")

cal -3 -m | sed -e 's/ '$day' /<'$day'>/g'
