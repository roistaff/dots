engine=$(ibus engine | grep -q skk && echo true || echo false)
if [ $engine == "true" ]; then
	echo "skk"
else
	echo "EN"
fi
