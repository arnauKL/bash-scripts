#!/usr/bin/env bash

## Change wallpaper and adjust colors using wallust
# wallust: rust implementation of pywal

# for sway

case "$1" in
    *)
        
    wallust pywal -i "$1"
        ;;
esac


# Reload sway to use new colours
swaymsg reload

# Restart waybar
pkill waybar && waybar &


# Not yet implemented

# Change wallpaper and tell sway about it 
#swaymsg output "*" bg "$(cat $HOME/.cache/wal/wal)" fill

# Done :)
notify-send "Wallpaper changed" "colours updated"
