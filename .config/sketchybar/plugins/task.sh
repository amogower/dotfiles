#!/bin/bash

update() {
	source "$CONFIG_DIR/colors.sh"
	source "$CONFIG_DIR/icons.sh"

	TASKS=$(task status:pending export)

	PENDING_TASK=$(task +PENDING count)
	OVERDUE_TASK=$(task +OVERDUE count)

	# if [[ $PENDING_TASK == 0 ]]; then
	# 	sketchybar --set $NAME label.drawing=off \
	# 		icon.padding_left=4 \
	# 		icon.padding_right=4
	# else
	# 	if [[ $OVERDUE_TASK == 0 ]]; then
	# 		LABEL=$PENDING_TASK
	# 	else
	# 		LABEL="!$OVERDUE_TASK/$PENDING_TASK"
	# 	fi

	# 	sketchybar --set $NAME label="${LABEL}" \
	# 		label.drawing=on \
	# 		icon.padding_left=6 \
	# 		icon.padding_right=2
	# fi

	args=()
	if [ "$TASKS" = "[]" ]; then
		args+=(--set $NAME label.drawing=off icon.padding_left=4 icon.padding_right=4)
	else
		if [[ $OVERDUE_TASK == 0 ]]; then
			LABEL=$PENDING_TASK
		else
			LABEL="!$OVERDUE_TASK/$PENDING_TASK"
		fi

		args+=(--set $NAME label="${LABEL}" label.drawing=on icon.padding_left=6 icon.padding_right=2)
	fi

	PREV_COUNT=$(sketchybar --query task | jq -r .label.value)
	# For sound to play around with:
	# afplay /System/Library/Sounds/Morse.aiff

	args+=(--remove '/task.task\.*/')

	COUNTER=0
	COLOR=$COLOR_CYAN
	args+=(--set task)

	while read -r id description urgency; do
		COUNTER=$((COUNTER + 1))
		COLOR=$COLOR_CYAN
		PADDING=0

		if [ "${id}" = "" ] && [ "${description}" = "" ]; then
			title="No new notifications"
		fi

		# if [ $urgency != 0 ]; then
		# 	COLOR=$RED
		# 	ICON=􀁞
			args+=(--set task)
		# fi

		notification=(
			label="$id: $(echo "$description" | sed -e "s/^'//" -e "s/'$//")"
			# icon=$ICON
			icon.padding_left="$PADDING"
			label.padding_right="$PADDING"
			position=popup.task
			icon.background.color=$COLOR
			drawing=on
		)

		args+=(--clone task.task.$COUNTER task.template
			--set task.task.$COUNTER "${notification[@]}")
	done <<<"$(echo "$TASKS" | jq -r '.[] | [.id, .description, .urgency] | @sh')"

	sketchybar -m "${args[@]}" >/dev/null

	if [ $COUNT -gt $PREV_COUNT ] 2>/dev/null || [ "$SENDER" = "forced" ]; then
		sketchybar --animate tanh 15 --set task label.y_offset=5 label.y_offset=0
	fi
}

popup() {
	sketchybar --set $NAME popup.drawing=$1
}

case "$SENDER" in
"routine" | "forced")
	update
	;;
"mouse.entered")
	popup on
	;;
"mouse.exited" | "mouse.exited.global")
	popup off
	;;
"mouse.clicked")
	popup toggle
	;;
esac
