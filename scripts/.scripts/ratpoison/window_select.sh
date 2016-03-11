#!/bin/bash


window_list=`ratpoison -c "windows"`

vmenu_cmd="vmenu --title Windows "
for line in $window_list
do
    number=`echo $line | head -c 1`
    vmenu_cmd+="'$line' "
    vmenu_cmd+="'ratpoison -c \"select $number\"' "
done

eval $vmenu_cmd
