#!/bin/bash
grim -o DP-1 /tmp/shot.png
magick /tmp/shot.png -blur 0x8 /tmp/blurred.png
