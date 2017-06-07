#!/bin/bash

sh induvidual_scrot.sh
convert /tmp/head_0.png -scale 10% -scale 1000% /tmp/head_0.png
[[ -f $1 ]] && convert /tmp/head_0.png $1 -gravity center -composite -matte /tmp/head_0.png
if [ -e /tmp/head_1.png ]; then
  convert /tmp/head_1.png -scale 10% -scale 1000% /tmp/head_1.png
  [[ -f $1 ]] && convert /tmp/head_1.png $1 -gravity center -composite -matte /tmp/head_1.png
  convert /tmp/head_0.png /tmp/head_1.png +append /tmp/screen.png
else
  mv /tmp/head_0.png /tmp/screen.png
fi
i3lock -i /tmp/screen.png
