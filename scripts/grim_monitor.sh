#!/bin/bash

mkdir -p $HOME/Pictures/screenshots

active_monitor=$(hyprctl -j activeworkspace|jq -r '(.monitor)')
screenshot_name="$HOME/Pictures/screenshots/$(date +"%d-%m-%Y-%H%S")-$active_monitor.png"

grim -o $active_monitor $screenshot_name 


if [ -e $screenshot_filename ]; then
    wl-copy < $screenshot_name
    notify-send "Grim" "Active Monitor Screenshot Saved \n $screenshot_filename" -i $screenshot_name
fi
