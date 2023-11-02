#!/bin/bash

slack=(
  script="$PLUGIN_DIR/slack.sh"
  update_freq=30
  padding_left=8
  padding_right=2
  background.border_width=0
  background.height=24
  icon=$ICON_CHAT
  icon.color=$COLOR_WHITE
  label.color=$COLOR_WHITE
)

sketchybar --add item slack left \
  --set slack "${slack[@]}"