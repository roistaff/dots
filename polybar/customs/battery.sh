battery=$(acpi | cut -d ':' -f2- | cut -d ',' -f2- | awk -F '%' '{print $1}' | awk -F ' ' '{print $1}')
echo "${battery}%"
