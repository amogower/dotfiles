#!/bin/bash

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

BATT_PERCENT=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
IS_CHARGING=$(pmset -g batt | grep 'AC Power')

if [[ $IS_CHARGING == "" ]]; then
	case ${BATT_PERCENT} in
	100)
		ICON=${BATTERY[10]}
		COLOR=$CATPUCCIN_GREEN
		;;
	9[0-9])
		ICON=${BATTERY[9]}
		COLOR=$CATPUCCIN_GREEN
		;;
	8[0-9])
		ICON=${BATTERY[8]}
		COLOR=$CATPUCCIN_GREEN
		;;
	7[0-9])
		ICON=${BATTERY[7]}
		COLOR=$CATPUCCIN_YELLOW
		;;
	6[0-9])
		ICON=${BATTERY[6]}
		COLOR=$CATPUCCIN_YELLOW
		;;
	5[0-9])
		ICON=${BATTERY[5]}
		COLOR=$CATPUCCIN_YELLOW
		;;
	4[0-9])
		ICON=${BATTERY[4]}
		COLOR=$CATPUCCIN_YELLOW
		;;
	3[0-9])
		ICON=${BATTERY[3]}
		COLOR=$CATPUCCIN_YELLOW
		;;
	2[0-9])
		ICON=${BATTERY[2]}
		COLOR=$CATPUCCIN_RED_BRIGHT
		;;
	1[0-9])
		ICON=${BATTERY[1]}
		COLOR=$CATPUCCIN_RED
		;;
	*)
		ICON=${BATTERY[0]}
		COLOR=$CATPUCCIN_RED
		;;
	esac
else
	case ${BATT_PERCENT} in
	100)
		ICON=${BATTERY_CHARGING[10]}
		;;
	9[0-9])
		ICON=${BATTERY_CHARGING[9]}
		;;
	8[0-9])
		ICON=${BATTERY_CHARGING[8]}
		;;
	7[0-9])
		ICON=${BATTERY_CHARGING[7]}
		;;
	6[0-9])
		ICON=${BATTERY_CHARGING[6]}
		;;
	5[0-9])
		ICON=${BATTERY_CHARGING[5]}
		;;
	4[0-9])
		ICON=${BATTERY_CHARGING[4]}
		;;
	3[0-9])
		ICON=${BATTERY_CHARGING[3]}
		;;
	2[0-9])
		ICON=${BATTERY_CHARGING[2]}
		;;
	1[0-9])
		ICON=${BATTERY_CHARGING[1]}
		;;
	*)
		ICON=${BATTERY_CHARGING[0]}
		;;
	esac
	COLOR=$CATPUCCIN_GREEN
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set $NAME icon=$ICON \
	icon.color=$COLOR \
	label="${BATT_PERCENT}%" \
	label.color=$COLOR