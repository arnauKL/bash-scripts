#!/usr/bin/env bash

# Wrapper to set volume and show a notification
# usage: "sh change-vol.sh up/down/mute"

# change volume with pactl
case "$1" in
  up)
    pactl set-sink-volume @DEFAULT_SINK@ +5%
    ;;
  down)
    pactl set-sink-volume @DEFAULT_SINK@ -5%
    ;;
  mute)
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    ;;
  *)
    echo "Usage: $0 {up|down|mute}"
    exit 1
    ;;
esac

#get the volume
vol=$(amixer sget Master | awk -F'[][]' 'END{print $2}')

# check if muted
muted=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

# notification
if [ "$muted" = "yes" ]; then
  notify-send -h string:x-canonical-private-synchronous:volume \
    " 󰝛 "
else
  notify-send -h int:value:$vol \
    -h string:x-canonical-private-synchronous:volume \
    "   $vol"
fi
