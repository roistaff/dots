#!/bin/bash
charging=$(acpi | cut -d ':' -f2- | grep -q "Charging" && echo true || echo false)
battery=$(acpi | cut -d ':' -f2- | cut -d ',' -f2- | awk -F '%' '{print $1}' | awk -F ' ' '{print $1}')
show_icon () {
if [ $battery -lt 15 ]; then
	if [ $charging == "true" ]; then
		echo "%{F#ff0000}%{F-}"
	else
		echo "%{F#ff0000}%{F-}"  #low
		notify-send -u critical "!LOW BATTERY!"

	fi
elif [ $battery -lt 51 ]; then
	if [ $charging == "true" ]; then
		echo  "%{F#ffff00}%{F-}"
	else
		echo  "%{F#ffff00}%{F-}"  #medium
	fi
elif [ $battery -gt 80 ]; then
	if [ $charging == "true" ]; then
		echo "%{F#008000}%{F-}"
	else
		echo "%{F#008000}%{F-}"
	fi
else
	if [ $charging == "true" ]; then
		echo  "%{F#0000FF}%{F-}"
	else
		echo  "%{F#0000FF}%{F-}"  #high
	fi
fi
}
show_num () {
	echo "${battery}%"
}
case "$1" in
	left)
		show_num
		sleep 3s
		show_icon
		;;
	*)
		show_icon
		;;
esac
