#!/bin/zsh

wallpaper_path=$1
data=$(find $wallpaper_path -type f  \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) -printf "img:$1/%P:text:%P\n") 

echo -e $data | wofi --show dmenu | {
    read -r id
    img="$(echo $id | awk -F: '{printf $2}')"
    echo $img
    swww img --transition-type outer --transition-pos 0.8,0.9 $img
    wal -i $img 
    ~/.config/hypr/scripts/wal_to_conf.sh
    killall -SIGUSR2 waybar &
}

