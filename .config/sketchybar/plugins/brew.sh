#!/bin/bash

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

COUNT="$(brew outdated | wc -l | tr -d ' ')"

COLOR=$RED

settings=()

case "$COUNT" in
[3-5][0-9])
	COLOR=$ORANGE
	;;
[1-2][0-9])
	COLOR=$YELLOW
	;;
[1-9])
	COLOR=$WHITE
	;;
0)
	COLOR=$GREEN
	COUNT=$CHECK
	settings+=(
		label.font="$FONT:Bold:14.0"
	)
	;;
esac

settings+=(
	label=$COUNT
	icon.color=$COLOR
)

sketchybar --set $NAME "${settings[@]}"
