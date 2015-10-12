#!/bin/bash


window_list=`ratpoison -c "windows"`

ratmen_cmd="ratmen --title Windows "
for line in $window_list
do
    number=`echo $line | head -c 1`
    ratmen_cmd+="'$line' "
    ratmen_cmd+="'ratpoison -c \"select $number\"' "
done

eval $ratmen_cmd
