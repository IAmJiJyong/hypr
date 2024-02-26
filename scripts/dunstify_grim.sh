#!/bin/bash

file_path=$1

if [ -z "$file_path" ]; then
    exit 1
fi

action=$(dunstify -A "Open Image,Open the image" -A "Open,Open the directory" -A "Delete,Delete the image" -i $file_path "Grim Result")

case "$action" in
   "Open Image")
       setsid --fork xdg-open "$file_path" ;;
    
   "Open")
       setsid --fork xdg-open "$HOME/Pictures/screenshots/";;

   "Delete")
       rm "$file_path";;


esac
