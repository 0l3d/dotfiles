#!/bin/bash
notify_icon_on="$HOME/.config/hypr/assets/icons/gamemode_on.png"
notify_icon_off="$HOME/.config/hypr/assets/icons/gamemode_off.png"

HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:drop_shadow 0;\
		keyword decoration:blur:passes 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0"
	
	hyprctl keyword "windowrule opacity 1 override 1 override 1 override, ^(.*)$"
    swww kill
    hyprctl keyword monitor DP-1,1920x1080@120,0x0,1
    notify-send -e -u low -i "$notify_icon_on" "Gamemode enabled. All animations off and Main Monitor switched to 180hz."
    exit
else
    hyprctl reload
    swww-daemon &
    $HOME/.config/hypr/scripts/swww.sh &
    hyprctl keyword monitor DP-1,1920x1080@60,0x0,1
    notify-send -e -u normal -i "$notify_icon_off" "Gamemode disabled. All animations normal and Main Monitor switched to 60hz."
    exit
fi
