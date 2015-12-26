#! /bin/sh

day=$( date "+%d")

cal -3 -m | sed -e 's/ '$day' /<25>/'
