#!/bin/bash

IMAGE=$HOME/.config/wallpapers/nature_forest.jpg

i3lock -i $IMAGE \
  --radius=16 --ring-width=12 \
  --insidecolor=00000000 --line-uses-inside \
  --insidevercolor=00000000 --veriftext="" \
  --insidewrongcolor=00000000 --wrongtext="" \
  --ringcolor=f9faf966 \
  --separatorcolor=00000000 \
  --keyhlcolor=f9faf9ff \
  --bshlcolor=f9faf9ff \
  --ringvercolor=f9faf9ff \
  --ringwrongcolor=ff7777 \
  --timecolor=f9faf9ff \
  --datecolor=f9faf9ff \
  --layoutcolor=000000ff \
  --clock \
  --indicator \
  --timestr="%H:%M:%S" \
  --datestr="%A, %d %B %Y" \
  --ignore-empty-password \
  --pass-media-keys \
  --pass-screen-keys \
  --pass-volume-keys \
  --indpos="80:1000" \
  --timepos="80+r+10:1000" \
  --time-align=1 \
  --date-align=1 \
  --time-font="SourceCode Pro" \
  --date-font="SourceCode Pro" \
  --datepos="80+r+10:1020" \
  --centered \
  --color=282a34ff

# Turn the screen off after delay
sleep 300; pgrep i3lock && xset dpms force off
