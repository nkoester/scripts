#!/bin/bash

num_screens=`xrandr | grep  -e " connected" | wc -l`
screen_names=(`xrandr | grep  -e " connected" | tr -s ' ' | cut -d " " -f 1`)
screen_resolutions=(`xrandr | grep  -e " connected" -A 1 | grep -v -e " connected" | grep -v -e "--" | tr -s ' ' | cut -d " " -f 2`)
# calculate x offsets
screen_offsets=(0)
i=1
while [ "$i" -lt "$num_screens" ]; do
  screen_offsets[$i]=`echo ${screen_resolutions[0]} | cut -d "x" -f 1`
  i=$(($i + 1))
done

echo "There are $num_screens screens available"

# create xrandr call
xrandr_call="xrandr"
xrandr_screen="--output %s --mode %s --pos %s --rotate %s"
i=0
while [ "$i" -lt "$num_screens" ]; do
  echo "screen $i : ${screen_names[$i]} @ ${screen_resolutions[$i]}"

  k=$(printf " $xrandr_screen" "${screen_names[$i]}" "${screen_resolutions[$i]}" "${screen_offsets[$i]}x0" "normal")

  xrandr_call="$xrandr_call $k"
  i=$(($i + 1))
done

#call it
# `$xrandr_call`
printf "\nXRANDR CALL:\n\n$xrandr_call\n\n"
res=`$xrandr_call`

