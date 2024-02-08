#!/bin/bash

mkdir -p $HOME/Pictures/screenshots

active_window=$(hyprctl -j activewindow|jq -r '(.class)')
screenshot_name="$HOME/Pictures/screenshots/$(date +"%d-%m-%Y-%H%S")-$active_window.png"

hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | grim -g - $screenshot_name


if [ -e $screenshot_filename ]; then
    wl-copy < $screenshot_name
    notify-send "Grim" "Active Monitor Screenshot Saved \n $screenshot_filename" -i $screenshot_name
fi
