#!/bin/bash

calendar=(
	script="$PLUGIN_DIR/calendar.sh"
	click_script="$PLUGIN_DIR/zen.sh"
	update_freq=30
	icon=cal
	icon.font="$FONT:Black:12.0"
	icon.padding_right=0
	label.width=45
	label.align=right
	padding_left=15
)

events=(
	system_woke
)

sketchybar --add item calendar right \
	--set calendar "${calendar[@]}" \
	--subscribe calendar "${events[@]}"
