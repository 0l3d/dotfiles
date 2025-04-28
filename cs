#!/bin/bash

DOTFILES_DIR="$HOME/.0l3d.Dotfiles"
CONFIG_DIR="$DOTFILES_DIR/0l3d.config"
CONFIG_DEST="$HOME/.config"

declare -A rename_map=(
    [Btop]="btop"
    [Doomemacs]="doom"
    [Fastfetch]="fastfetch"
    [Hyprland]="hypr"
    [Kitty]="kitty"
    [Rofi]="rofi"
    [Swaync]="swaync"
    [Waybar]="waybar"
    [Wlogout]="wlogout"
    [Wofi]="wofi"
    [Zsh]="zsh"
)

echo "=== 0l3d Config's ==="

i=1
declare -A config_map

for dir in "$CONFIG_DIR"/*/; do
    name=$(basename "$dir")

    if [[ "$name" == "0l3d.me" ]]; then
        display_name="0l3d's Config"
    else
        part1="${name%%.*}"
        part2="${name##*.}"
        part2_cap="${part2^}"
        display_name="$part1 $part2_cap"
    fi

    echo "[$i] $display_name"
    config_map[$i]="$name"
    ((i++))
done

echo "[v] View config contents"
read -p "Select a config or press 'v' to view config contents: " choice

if [[ "$choice" == "v" ]]; then
    declare -A sub_map
    declare -A sub_map_origin
    global_index=1

    for dir in "$CONFIG_DIR"/*/; do
        conf_name=$(basename "$dir")

        if [[ "$conf_name" == "0l3d.me" ]]; then
            title="0l3d's Config"
        else
            part1="${conf_name%%.*}"
            part2="${conf_name##*.}"
            part2_cap="${part2^}"
            title="$part1 $part2_cap"
        fi

        echo
        echo "=== All config contents in $title ==="
        local_index=1

        for subdir in "$dir"/*/; do
            sub_name=$(basename "$subdir")
            echo "[$local_index] $sub_name"
            # sub_map uses "title-index" key
            key="$title|$local_index"
            sub_map["$key"]="$subdir"
            sub_map_origin["$local_index|$title"]="$key"
            ((local_index++))
        done
    done

    echo
    read -p 'Select config name and number (e.g. "0l3d Xfce 2") or "q" to quit: ' input1 input2 input3

    if [[ "$input1" == "q" ]]; then
        echo "Exited config view."
        exit 0
    fi

    title="$input1 $input2"
    index="$input3"
    if [[ -z "$index" ]]; then
        echo "Invalid input format. Try: 0l3d Xfce 2"
        exit 1
    fi

    key="${title}|${index}"
    selected_path="${sub_map[$key]}"
    if [ -z "$selected_path" ]; then
        echo "Invalid selection."
        exit 1
    fi

    folder_name=$(basename "$selected_path")
    target_name="${rename_map[$folder_name]:-${folder_name,,}}"

    echo "Applying config: $folder_name -> $target_name"
    cp -r "$selected_path" "$CONFIG_DEST/$target_name"
    echo "Config '$folder_name' applied successfully to ~/.config"

else
    selected="${config_map[$choice]}"
    selected_path="$CONFIG_DIR/$selected"

    for dir in "$selected_path"/*/; do
        folder_name=$(basename "$dir")
        target_name="${rename_map[$folder_name]:-${folder_name,,}}"
        echo "Applying config: $folder_name -> $target_name"
        cp -r "$dir" "$CONFIG_DEST/$target_name"
    done

    echo "All configs from '$selected' applied successfully to ~/.config"
fi
