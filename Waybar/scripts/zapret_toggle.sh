#!/bin/bash
if rc-service zapret status | grep -q "started"; then
    kitty doas rc-service zapret stop && exit
else
    kitty doas rc-service zapret start && exit
fi
