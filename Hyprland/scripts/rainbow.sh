function random_hex() {
    random_hex=("0xff$(openssl rand -hex 3)")
    echo $random_hex
}

while true
do
	sleep 0.5
	hyprctl keyword general:col.active_border $(random_hex)  $(random_hex) $(random_hex) $(random_hex) $(random_hex) $(random_hex) $(random_hex) $(random_hex) $(random_hex) $(random_hex)  270deg
	sleep 0.3
done
