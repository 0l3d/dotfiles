#!/bin/bash

TOGGLE_FILE="/tmp/hyprsunset_toggle"

if [ ! -f "$TOGGLE_FILE" ]; then
    hyprsunset -t 4000  > /dev/null 2>&1 &
    touch "$TOGGLE_FILE"
else
    hyprsunset -i  > /dev/null 2>&1 &
    rm "$TOGGLE_FILE" 
fi
