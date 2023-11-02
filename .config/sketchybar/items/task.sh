#!/bin/bash

task=(
	script="$PLUGIN_DIR/task.sh"
	update_freq=300
	padding_left=2
	padding_right=2
	background.border_width=0
	background.height=24
	icon=$ICON_LIST
	icon.color=$COLOR_CYAN
	label.color=$COLOR_CYAN
)

task_template=(
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
)

sketchybar --add item task left \
	--set task "${task[@]}" \
	--subscribe task "${events[@]}" \
	\
	--add item task.template popup.task \
	--set task.template "${github_template[@]}"

