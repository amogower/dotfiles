#!/bin/bash

battery=(
	script="$PLUGIN_DIR/battery.sh"
	update_freq=120
	padding_right=8
	padding_left=2
	background.border_width=0
	background.height=24
)

events=(
	system_woke
	power_source_change
)

sketchybar --add item battery right \
	--set battery "${battery[@]}" \
	--subscribe battery "${events[@]}"
