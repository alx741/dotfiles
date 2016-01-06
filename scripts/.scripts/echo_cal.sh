#! /bin/sh

day=$(date "+%_d" | tr -d " ")

echo "$day"
cal -3 -m | sed -e 's/ '$day' /<'$day'>/'
