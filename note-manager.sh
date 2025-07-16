#!/usr/bin/env bash

NOTES_DIRECTORY="$HOME/Notes/"

case "$1" in
    # For now
    *)
        cd $NOTES_DIRECTORY && nvim .
        ;;
esac
