#!/bin/bash

WRKSPCE_FOCUS=`i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d"\"" -f2`

xrandr --output eDP-1 --primary --mode 1920x1080 --pos 1920x720 --rotate normal --output HDMI-3 --off --output HDMI-2 --off --output HDMI-1 --off --output DP-3 --off --output DP-2 --off --output DP-1 --mode 1920x1200 --pos 0x0 --rotate normal

echo "xrandr done ..."
sleep 1

for i in {1..15}
do
    echo "moving workspace $i"
    if [[ $i -le 5 ]]; then
        i3-msg workspace number $i; i3-msg move workspace to output DP-1
    else
        i3-msg workspace number $i; i3-msg move workspace to output DP-1
    fi
done

echo "selecting last selected workspace ..."
i3-msg workspace $WRKSPCE_FOCUS
