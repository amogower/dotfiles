#!/bin/bash

# update() {
# 	source "$CONFIG_DIR/icons.sh"
# 	INFO="$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F ' SSID: ' '/ SSID: / {print $2}')"
# 	LABEL="$INFO ($(ipconfig getifaddr en0))"
# 	ICON="$([ -n "$INFO" ] && echo "$WIFI_CONNECTED" || echo "$WIFI_DISCONNECTED")"

# 	sketchybar --set $NAME icon="$ICON" label="$LABEL"
# }

# click() {
# 	CURRENT_WIDTH="$(sketchybar --query $NAME | jq -r .label.width)"

# 	WIDTH=0
# 	if [ "$CURRENT_WIDTH" -eq "0" ]; then
# 		WIDTH=dynamic
# 	fi

# 	sketchybar --animate sin 20 --set $NAME label.width="$WIDTH"
# }

# case "$SENDER" in
# "wifi_change")
# 	update
# 	;;
# "mouse.clicked")
# 	click
# 	;;
# esac

update() {
	source "$CONFIG_DIR/icons.sh"
	source "$CONFIG_DIR/colors.sh"

	NETWORK="$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F ' SSID: ' '/ SSID: / {print $2}')"
	IP_ADDRESS=$(ipconfig getifaddr en0)
	IS_VPN=$(scutil --nwi | grep -m1 'utun' | awk '{ print $1 }')

	LABEL=""

	if [[ $IS_VPN != "" ]]; then
		COLOR=$COLOR_CYAN
		ICON=$LOCK
		LABEL="$NETWORK ($IP_ADDRESS)"
	elif [[ $IP_ADDRESS != "" ]]; then
		COLOR=$COLOR_BLUE
		ICON=$WIFI_CONNECTED
		LABEL="$NETWORK ($IP_ADDRESS)"
	else
		COLOR=$WHITE
		ICON=$WIFI_DISCONNECTED
		LABEL="Not Connected"
	fi

	sketchybar --set $NAME \
		background.color=$COLOR \
		icon="$ICON" \
		label="$LABEL"
}

click() {
	CURRENT_WIDTH="$(sketchybar --query $NAME | jq -r .label.width)"

	WIDTH=0
	if [ "$CURRENT_WIDTH" -eq "0" ]; then
		WIDTH=dynamic
	fi

	sketchybar --animate sin 20 --set $NAME label.width="$WIDTH"
}

case "$SENDER" in
"wifi_change")
	update
	;;
"mouse.clicked")
	click
	;;
esac
