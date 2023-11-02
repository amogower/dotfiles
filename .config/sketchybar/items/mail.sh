#!/bin/bash

mail=(
  script="$PLUGIN_DIR/noti_mail.sh"
  update_freq=30
  padding_left=2
  padding_right=2
  background.border_width=0
  background.height=24
  icon=$ICON_MAIL
  icon.color=$COLOR_BLUE
  label.color=$COLOR_BLUE
)

sketchybar --add item mail left \
  --set mail "${mail[@]}"