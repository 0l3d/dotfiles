#!/bin/bash

swaync_dir="$HOME/.config/swaync"
themes_dir="$swaync_dir/themes"

echo "Available themes:"
i=1
for theme in "$themes_dir"/*; do
    if [ -d "$theme" ]; then
        echo "$i. $(basename "$theme")"
        ((i++))
    fi
done

read -p "Select a theme folder (1-$((i-1))): " theme_selection
selected_theme=$(ls "$themes_dir" | sed -n "${theme_selection}p")

if [ -d "$themes_dir/$selected_theme" ]; then
    rm -f "$swaync_dir/config.json"
    rm -f "$swaync_dir/style.css"

    cp "$themes_dir/$selected_theme/config.json" "$swaync_dir/config.json"
    cp "$themes_dir/$selected_theme/style.css" "$swaync_dir/style.css"

    echo "Configuration applied from theme: $selected_theme"
else
    echo "Invalid selection."
fi


pkill swaync
swaync > /dev/null 2>&1 &

echo "swaync has been restarted in the background."
