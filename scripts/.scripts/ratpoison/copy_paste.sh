#!/bin/sh

current_window=`ratpoison -c 'info' | sed 's/(.*).*(\(.*\))/\1/'\
                | tr '[:upper:]' '[:lower:]'`

# When in a terminal window just send ctrl_c through
if [[ "$current_window" == "urxvt" ]];
then
    ratpoison -c "echo URXVT"
    # ratpoison -c "meta C-c"
    # exit 0
fi


###
### Calculate on which screen the rat is
###
ratpoison -c "sdump" | sed 's/,/\n/g' > /tmp/ratpoison_cursor_frame
abs_rat_x=$(ratpoison -c "ratinfo" | cut -d' ' -f1)
abs_rat_y=$(ratpoison -c "ratinfo" | cut -d' ' -f2)
echo
echo "ABS rat x: $abs_rat_x"
echo "ABS rat y: $abs_rat_y"
echo

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
    echo
    echo "NUM: $screen_number"
    echo "screen x0: $screen_x0"
    echo "screen y0: $screen_y0"
    echo "screen w: $screen_w"
    echo "screen h: $screen_h"
    echo "screen x1: $screen_x1"
    echo "screen y1: $screen_y1"

    if [[ $abs_rat_x -ge $screen_x0 ]] && [[ $abs_rat_y -ge $screen_y0 ]];then
       if  [[ $abs_rat_x -le $screen_x1 ]] && [[ $abs_rat_y -le $screen_y1 ]];then
            RAT_ON_SCREEN=$screen_number
            SCREEN_X=$screen_x0
            SCREEN_Y=$screen_y0
            ratpoison -c "echo RAT on screen:  $screen_number"
            break
       fi
   fi
done < /tmp/ratpoison_cursor_frame


###
### Calculate rat coordinates relative to screen
###
RAT_X=$(($abs_rat_x - $SCREEN_X))
RAT_Y=$(($abs_rat_y - $SCREEN_Y))
echo
echo "rat x: $RAT_X"
echo "rat y: $RAT_Y"
echo




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
    echo
    echo "fn: $frame_number"
    echo "fram x0: $frame_x0"
    echo "fram y0: $frame_y0"
    echo "fram w: $frame_w"
    echo "fram h: $frame_h"
    echo "fram x1: $frame_x1"
    echo "fram y1: $frame_y1"

    if [[ $RAT_X -ge $frame_x0 ]] && [[ $RAT_Y -ge $frame_y0 ]];then
       if  [[ $RAT_X -le $frame_x1 ]] && [[ $RAT_Y -le $frame_y1 ]];then
            RAT_ON_FRAME=$frame_number
            ratpoison -c "echo RAT on FRAME:  $frame_number"
            break
       fi
   fi
done < /tmp/ratpoison_cursor_frame

echo
echo "Rat in SCREEN: $RAT_ON_SCREEN, FRAME: $RAT_ON_FRAME"
echo

# # ratpoison -c "fselect $rat_on_frame"
# # if [[ "$1" == "copy" ]];
# # then
# #     ratpoison -c "meta C-c"
# # else
# #     ratpoison -c "meta C-v"
# # fi
