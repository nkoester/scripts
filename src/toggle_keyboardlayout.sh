#!/bin/bash

seven=`xmodmap -pke | grep "keycode  16" | awk '{print \$5}'` 

## If this is the "us" layout
if [ $seven == "ampersand" ]; then
    setxkbmap -option caps:escape,compose:menu de
    notify-send "Keyboard Layout set to: German (de)" -t 2000 -u low -i /usr/share/icons/gnome/48x48/status/dialog-information.png
    xset led 3
else
    setxkbmap -option caps:escape,compose:menu us
    notify-send "Keyboard Layout set to: English (us)" -t 2000 -u low -i /usr/share/icons/gnome/48x48/status/dialog-information.png
    xset -led 3
fi

