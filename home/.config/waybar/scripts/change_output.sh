#!/bin/bash

# Get the current audio sink
current_sink=$(pactl get-default-sink)

# List all audio sinks and find the next one
next_sink=$(pactl list short sinks | awk -v current="$current_sink" '
    $2 == current {getline; print $2; exit}
    {print $2}
' | head -n 1)

# If there is a next sink, set it as the default
if [ -n "$next_sink" ]; then
    pactl set-default-sink "$next_sink"
    notify-send "Audio Output Changed" "New audio output: $next_sink" -i ~/.config/hypr/assets/icons/sound.png
else
    notify-send "Audio Output Could Not Be Changed" "Current audio output: $current_sink" -i ~/.config/hypr/assets/icons/sound.png
fi

