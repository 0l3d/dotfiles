#!/bin/bash

updates_output=$(emerge --pretend --update --deep --newuse @world)

updates=$(echo "$updates_output" | grep "Total:" | awk '{print $2}')

echo "$updates"
