#!/bin/bash

wallpaper_path=$1
random_image=$(find $wallpaper_path -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | shuf -n 1)
# echo $random_image
# echo $(printf "%q" "$random_image")


wal -i "$random_image" > /dev/null

swww img --transition-type outer --transition-pos 0.8,0.9 "$random_image"

~/.config/hypr/scripts/wal_to_conf.sh

# swaymsg output '*' bg "$(printf "%q" "$random_image")" fill > /dev/null
# swaymsg output eDP-1  bg $random_image fill > /dev/null
killall -SIGUSR2 waybar & disown
