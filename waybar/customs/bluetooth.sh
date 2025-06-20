if bluetoothctl show | grep -q "Powered: yes" ; then
	if bluetoothctl info | grep -q "Connected: yes" ; then
		echo '{"text":"","class":"connected"}'
	else
		echo '{"text":"","class":"usual"}'
	fi
else
	echo '{"text":"","class":"disconnected"}'
fi
#if [ bluetoothctl info | grep -q "Connected: yes" ]; then
