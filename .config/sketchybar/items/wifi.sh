#!/bin/bash

source "$CONFIG_DIR/icons.sh"

# wifi=(
# 	padding_right=7
# 	label.width=0
# 	icon="$WIFI_DISCONNECTED"
# 	script="$PLUGIN_DIR/wifi.sh"
# )

wifi=(
	script="$PLUGIN_DIR/wifi.sh"
  update_freq=30
  padding_left=8
  padding_right=0
  background.border_width=0
  background.corner_radius=6
  background.height=20
  icon.highlight=on
	icon.padding_right=5
  label.highlight=on
	label.width=0
)

events=(
  wifi_change
  mouse.clicked
)

sketchybar --add item wifi right \
	--set wifi "${wifi[@]}" \
	--subscribe wifi "${events[@]}"
