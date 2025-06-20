if bluetoothctl show | grep -q "Powered: yes" ; then
	if bluetoothctl info | grep -q "Connected: yes" ; then
		echo "%{F#0000FF}%{F-}"
	else
		echo "%{F#808080}%{F-}"
	fi
else
	echo "%{F#ff0000}%{F-}"
fi
#if [ bluetoothctl info | grep -q "Connected: yes" ]; then
