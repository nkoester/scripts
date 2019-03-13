#!/bin/bash

WRKSPCE_FOCUS=`i3-msg -t get_workspaces | jq '.[] | select(.visible==true).name' | cut -d"\"" -f2`

xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x936 --rotate normal --output HDMI-3 --off --output DP-2 --mode 1920x1200 --pos 3840x0 --rotate left --output DP-1 --mode 1920x1200 --pos 1920x552 --rotate normal --output DP-3 --off --output HDMI-2 --off --output HDMI-1 --off

echo "xrandr done ..."

# some bug here? mhh
sleep 0.25

for i in {1..15}
do
    echo "moving workspace $i"
    if [[ $i -le 5 ]]; then
        i3-msg workspace number $i; i3-msg move workspace to output DP-1
    else
        i3-msg workspace number $i; i3-msg move workspace to output DP-2
    fi
done

sleep 0.25

i3-msg workspace number 10; i3-msg move workspace to output eDP-1
i3-msg workspace number 1; i3-msg move workspace to output DP-1

bright_ctrl 600 || echo "WARNIG: cannot find brightness control script..."


echo "selecting last selected workspace ..."
i3-msg workspace number 5
i3-msg workspace number 10
i3-msg workspace number 1
while read -r line; do
    i3-msg workspace $line
done <<< "$WRKSPCE_FOCUS"
