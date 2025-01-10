#!/bin/bash
if rc-service zapret status | grep -q "started"; then
    echo " 󰒘 "
else
    echo " 󰫜 "
fi

