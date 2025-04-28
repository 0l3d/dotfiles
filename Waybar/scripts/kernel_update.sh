#!/bin/bash

output=$(emerge --pretend --update --deep --newuse @world)
line=$(echo "$output" | grep "sys-kernel/gentoo-sources")

if [[ -n "$line" ]]; then
    new_version=$(echo "$line" | sed -n 's/.*gentoo-sources-\([^:]*\).*/\1/p')
    current_version=$(echo "$line" | sed -n 's/.*\[\([^:]*\).*/\1/p')

    echo "Kernel Update: $current_version -> $new_version"
else
    echo ""
fi
