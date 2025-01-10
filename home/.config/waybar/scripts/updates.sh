#!/bin/bash


updates=$(emerge --pretend --update --deep --newuse @world | grep "Total:" | awk '{print $2}')
tooltip=$
echo "$updates"
