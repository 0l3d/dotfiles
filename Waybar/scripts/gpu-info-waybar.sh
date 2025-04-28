#!/bin/bash
temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)
fanspeed=$(nvidia-smi --query-gpu=fan.speed --format=csv,noheader)
memused=$(nvidia-smi --query-gpu=memory.used --format=csv,noheader)
echo "$temp 󰔄 $fanspeed $memused"
