#!/bin/bash
for f in $(cat ~/.0l3d.Dotfiles/config.list); do mv $HOME/.0l3d.Dotfiles/$(echo $f | cut -d'/' -f2) $HOME/.config/$(echo $f | cut -d'/' -f1); done
