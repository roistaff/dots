#!/bin/bash
acpi1=$(acpi | sed -n 1p)
acpi2=$(acpi | sed -n 2p)

charging1=$(echo "$acpi1" | grep -q "Charging" && echo true || echo false)
charging2=$(echo "$acpi2" | grep -q "Charging" && echo true || echo false)

battery1=$(echo "$acpi1" | cut -d ':' -f2- | cut -d ',' -f2- | awk -F '%' '{print $1}' | awk '{print $1}')
battery2=$(echo "$acpi2" | cut -d ':' -f2- | cut -d ',' -f2- | awk -F '%' '{print $1}' | awk '{print $1}')

show_icon () {
	bat="$1"
	if [ "$bat" -eq 1 ]; then
		charging="$charging1"
		battery="$battery1"
	elif [ "$bat" -eq 2 ]; then
		charging="$charging2"
		battery="$battery2"
	else
		exit 0
	fi

	if [ "$battery" -lt 15 ]; then
		if [ "$charging" == "true" ]; then
			echo "%{F#ff0000}%{F-}"
		else
			echo "%{F#ff0000}%{F-}"
#			notify-send -u critical "!LOW BATTERY $bat!"
		fi
	elif [ "$battery" -lt 51 ]; then
		if [ "$charging" == "true" ]; then
			echo "%{F#ffff00}%{F-}"
		else
			echo "%{F#ffff00}%{F-}"
		fi
	elif [ "$battery" -gt 80 ]; then
		if [ "$charging" == "true" ]; then
			echo "%{F#008000}%{F-}"
		else
			echo "%{F#008000}%{F-}"
		fi
	else
		if [ "$charging" == "true" ]; then
			echo "%{F#0000FF}%{F-}"
		else
			echo "%{F#0000FF}%{F-}"
		fi
	fi
}

case "$1" in
	1)
		show_icon 1
		;;
	2)
		show_icon 2
		;;
	*)
		show_icon 1
		show_icon 2
		;;
esac

