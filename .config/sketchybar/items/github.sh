#!/bin/bash

POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"

github_bell=(
	script="$PLUGIN_DIR/github.sh"
	click_script="$POPUP_CLICK_SCRIPT"
	update_freq=180
	padding_right=2
	icon=$BELL
	icon.font="$FONT:Bold:12.0"
	icon.color=$BLUE
	label=$LOADING
	label.highlight_color=$BLUE
	popup.align=right
)

github_template=(
	drawing=off
	background.corner_radius=12
	padding_left=7
	padding_right=7
	icon.background.height=2
	icon.background.y_offset=-12
)

events=(
	mouse.entered
	mouse.exited
	mouse.exited.global
	github.update
)

sketchybar --add event github.update \
	--add item github.bell left \
	--set github.bell "${github_bell[@]}" \
	--subscribe github.bell "${events[@]}" \
	\
	--add item github.template popup.github.bell \
	--set github.template "${github_template[@]}"
