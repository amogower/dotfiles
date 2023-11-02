#!/bin/bash

timew=(
  script="$PLUGIN_DIR/timew.sh"
  update_freq=30
  padding_left=2
  padding_right=2
  background.border_width=0
  background.height=24
  icon=$ICON_CLOCK
  icon.color=$COLOR_YELLOW
  label.color=$COLOR_YELLOW
)

sketchybar --add item timew left \
  --set timew "${timew[@]}"