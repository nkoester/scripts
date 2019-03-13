#!/usr/bin/bash

RUBY=/usr/bin/ruby
# SCRIPT=/tmp/Rofi-Leo-Dictionary/leo_search.rb
# HISTORY=/tmp/Rofi-Leo-Dictionary/test2
SCRIPT=~/local/bin/leo_search.rb
HISTORY=~/.cache/rofileo

# load clipboard content (for translating highlighted text)
input=`xclip -o`
echo "checking $input"
input=`$RUBY $SCRIPT "$input" | rofi -dmenu -l 30 -p "Leo Dict: "`

# Call menu as long as exit code is 0 (esc is not pressed)
while [ "$?" -eq "0" ]; do
  # write search to history
  [[ ! -z "$input" ]] && `echo $input >> $HISTORY`
  echo -n "$input" | xclip -selection clipboard
  input=`$RUBY $SCRIPT "$input" | rofi -dmenu -l 30 -p "Leo Dict: "`
  # echo "$input"
done

