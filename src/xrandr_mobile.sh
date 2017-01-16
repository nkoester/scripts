#!/bin/sh
xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-3 --off --output HDMI-2 --off --output HDMI-1 --off --output DP-3 --off --output DP-2 --off --output DP-1 --off

bright_ctrl 200 || echo "WARNIG: cannot find brightness control script..."

sleep 1

i3-msg workspace number 1
