#!/bin/bash
WALLPAPER_DIR="$HOME/.config/hypr/assets/wallpapers"

SCREEN1="DP-1"
SCREEN2="HDMI-A-1"

TRANSITION_STEP=1
TRANSITION_FPS=60

# DP-1
RANDOM_WALLPAPER1=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
swww img -o "$SCREEN1" "$RANDOM_WALLPAPER1" --transition-step "$TRANSITION_STEP" --transition-fps "$TRANSITION_FPS" --transition-type center

# HDMI-A-1
RANDOM_WALLPAPER2=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

while [ "$RANDOM_WALLPAPER1" == "$RANDOM_WALLPAPER2" ]; do
    RANDOM_WALLPAPER2=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
done

swww img -o "$SCREEN2" "$RANDOM_WALLPAPER2" --transition-step "$TRANSITION_STEP" --transition-fps "$TRANSITION_FPS" --transition-type center

SWWW_SCRIPT="$HOME/.config/hypr/scripts/swww.sh"
echo "#!/bin/bash" > "$SWWW_SCRIPT"
echo "swww img -o \"$SCREEN1\" \"$RANDOM_WALLPAPER1\" --transition-step \"$TRANSITION_STEP\" --transition-fps \"$TRANSITION_FPS\" --transition-type center" >> "$SWWW_SCRIPT"
echo "swww img -o \"$SCREEN2\" \"$RANDOM_WALLPAPER2\" --transition-step \"$TRANSITION_STEP\" --transition-fps \"$TRANSITION_FPS\" --transition-type center" >> "$SWWW_SCRIPT"
