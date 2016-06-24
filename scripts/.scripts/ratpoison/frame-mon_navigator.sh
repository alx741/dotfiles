#!/bin/sh

ratpoison -c 'fdump'| sed 's/,/\n/g' | awk '{print $5" "$19}' > /tmp/ratpoison_frame_monitor_navigator

# Calculate X coordinate for rightmost frame
greater_x_coordinate=0
while read frame;
do
    coordinate=$(echo "$frame" | cut -d' ' -f1)
    if [[ $coordinate -gt $greater_x_coordinate ]];
    then
        greater_x_coordinate=$coordinate
    fi
done < /tmp/ratpoison_frame_monitor_navigator


# Calculate current frame X coordinate
x_coordinate=$(head -n1 /tmp/ratpoison_frame_monitor_navigator | cut -d' ' -f1)
last_access=$(head -n1 /tmp/ratpoison_frame_monitor_navigator | cut -d' ' -f2)
while read frame;
do
    access=$(echo "$frame" | cut -d' ' -f2)
    if [[ $access -gt $last_access ]];
    then
        last_access=$access
        x_coordinate=$(echo "$frame" | cut -d' ' -f1)
    fi
done < /tmp/ratpoison_frame_monitor_navigator

function is_leftmost
{
    if [[ $x_coordinate -eq 0 ]]; then
        return 0
    else
        return 1
    fi
}

function is_rightmost
{
    if [[ $x_coordinate -eq $greater_x_coordinate ]]; then
        return 0
    else
        return 1
    fi
}


# Go to previous screen if currently if leftmost frame
# Go to next screen if currently if rightmost frame
# Execute frame focus otherwise
if [[ "$1" == "left" ]];
then
    if is_leftmost; then
        ratpoison -c 'prevscreen'
    else
        ratpoison -c 'focusleft'
    fi
elif [[ "$1" == "right" ]];
then
    if is_rightmost; then
        ratpoison -c 'nextscreen'
    else
        ratpoison -c 'focusright'
    fi
fi
