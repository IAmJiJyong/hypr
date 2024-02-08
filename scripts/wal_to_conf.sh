#!/bin/bash

data=($(sed  -n 's/#//;1p;2p;4p;' ~/.cache/wal/colors))

echo "
env = SLURP_ARGS, -d -b -B data[0] -b data[1] -c data[2]
general {
    col.active_border = rgba(${data[2]}ee) rgba(${data[1]}ee) 45deg
    col.inactive_border = rgba(${data[0]}aa)
}" > ~/.config/hypr/colors.conf
