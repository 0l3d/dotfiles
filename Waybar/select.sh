#!/bin/bash

waybar_dir="$HOME/.config/waybar"
themes_dir="$waybar_dir/themes"
bars_dir="$waybar_dir/bars"

echo "Themes:"
i=1
for theme in "$themes_dir"/*; do
    if [ -f "$theme" ]; then
        echo "$i. $(basename "$theme")"
        ((i++))
    fi
done

read -p "Select a theme (1-$((i-1))): " theme_selection
selected_theme=$(ls "$themes_dir" | sed -n "${theme_selection}p")

echo "Bars:"
i=1
for bar in "$bars_dir"/*; do
    if [ -f "$bar" ]; then
        echo "$i. $(basename "$bar")"
        ((i++))
    fi
done

read -p "Select a bar (1-$((i-1))): " bar_selection
selected_bar=$(ls "$bars_dir" | sed -n "${bar_selection}p")

rm -f "$waybar_dir/config"
rm -f "$waybar_dir/style.css"

cp "$bars_dir/$selected_bar" "$waybar_dir/config"
cp "$themes_dir/$selected_theme" "$waybar_dir/style.css"

echo "Your selections have been applied: "
echo "Theme: $selected_theme"
echo "Bar: $selected_bar"

pkill waybar
waybar > /dev/null 2>&1 &
