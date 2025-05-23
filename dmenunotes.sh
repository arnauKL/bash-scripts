#!/usr/bin/bash

folder=$("$HOME/Notes")

choice=$(echo -e "new\n$(ls -t1 $folder)" | wmenu )

case $choice in
    new) newnote ;;
    *md) setsid -f "$TERMINAL" -e nvim "$folder$choice" >/dev/null 2>&1 ;;        # setsid -f "$TERMINAL" -e nvim "$folder$choice" >/dev/null 2>&1 ;;
    *) exit;;
esac
