#!/bin/bash

TOGGLE_FILE="/tmp/hyprsunset_toggle"

if [ ! -f "$TOGGLE_FILE" ]; then
    echo " 󰈉 "
else
    echo " 󰈈 "
fi
