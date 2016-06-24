#!/bin/sh

###
### Calculate on which screen the rat is
###
ratpoison -c "sdump" | sed 's/,/\n/g' > /tmp/ratpoison_cursor_frame
abs_rat_x=$(ratpoison -c "ratinfo" | cut -d' ' -f1)
abs_rat_y=$(ratpoison -c "ratinfo" | cut -d' ' -f2)

RAT_ON_SCREEN=0
SCREEN_X=0
SCREEN_Y=0
while read screen;
do
    screen_number=$(echo "$screen" | cut -d' ' -f1)
    screen_x0=$(echo "$screen" | cut -d' ' -f2)
    screen_y0=$(echo "$screen" | cut -d' ' -f3)
    screen_w=$(echo "$screen" | cut -d' ' -f4)
    screen_h=$(echo "$screen" | cut -d' ' -f5)
    screen_x1=$(($screen_x0 + $screen_w))
    screen_y1=$(($screen_y0 + $screen_h))

    if [[ $abs_rat_x -ge $screen_x0 ]] && [[ $abs_rat_y -ge $screen_y0 ]];then
       if  [[ $abs_rat_x -le $screen_x1 ]] && [[ $abs_rat_y -le $screen_y1 ]];then
            RAT_ON_SCREEN=$screen_number
            SCREEN_X=$screen_x0
            SCREEN_Y=$screen_y0
            break
       fi
   fi
done < /tmp/ratpoison_cursor_frame


###
### Calculate rat coordinates relative to screen
###
RAT_X=$(($abs_rat_x - $SCREEN_X))
RAT_Y=$(($abs_rat_y - $SCREEN_Y))


###
### Calculate inside which frame the rat is
###
### /tmp/ratpoison_cursor_frame contains data in format: X Y WIDTH HEIGH FRAME
ratpoison -c "sfdump" | sed 's/,/\n/g' | grep ".* $RAT_ON_SCREEN$" | awk '{print $5" "$7" "$9" "$11" "$3}' > /tmp/ratpoison_cursor_frame

RAT_ON_FRAME=0
while read frame;
do
    frame_x0=$(echo "$frame" | cut -d' ' -f1)
    frame_y0=$(echo "$frame" | cut -d' ' -f2)
    frame_w=$(echo "$frame" | cut -d' ' -f3)
    frame_h=$(echo "$frame" | cut -d' ' -f4)
    frame_x1=$(($frame_x0 + $frame_w))
    frame_y1=$(($frame_y0 + $frame_h))
    frame_number=$(echo "$frame" | cut -d' ' -f5)

    if [[ $RAT_X -ge $frame_x0 ]] && [[ $RAT_Y -ge $frame_y0 ]];then
       if  [[ $RAT_X -le $frame_x1 ]] && [[ $RAT_Y -le $frame_y1 ]];then
            RAT_ON_FRAME=$frame_number
            break
       fi
   fi
done < /tmp/ratpoison_cursor_frame

ratpoison -c "fselect $RAT_ON_FRAME"
