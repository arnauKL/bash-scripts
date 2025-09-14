#!/usr/bin/env bash

# Wrapper to set brightness and show a notification
# usage: "sh change-brightness.sh up/down"

# change brightness with brightnessctl
case "$1" in
    up)
        brightnessctl -s set 2%+
        ;;
    down)
        brightnessctl -s set 2%-
        ;;
    *)
        echo "Usage: $0 {up|down}"
        exit 1
        ;;
esac

#get the brightness level
br_level=$(brightnessctl get)

br_percent=$(( br_level / 4 ))

# notification
notify-send -h int:value:$br_percent \
    -h string:x-canonical-private-synchronous:brightness \
    "${br_percent}%"

