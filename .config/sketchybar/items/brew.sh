#!/bin/bash

# Trigger the brew_udpate event when brew update or upgrade is run from cmdline
# e.g. via function in .zshrc

brew=(
	script="$PLUGIN_DIR/brew.sh"
	update_freq=300
	icon=􀐛
	icon.font="$FONT:Bold:12.0"
	label=$LOADING
	padding_right=2
)

events=(
	brew_update
)

sketchybar --add event brew_update \
	--add item brew left \
	--set brew "${brew[@]}" \
	--subscribe brew "${events[@]}"
