#!/usr/bin/env bash

NOTES_DIRECTORY="$HOME/Notes/"

case "$1" in
    *"new"*)
        cd $NOTES_DIRECTORY && nvim .
        ;;
    *)
        cd $NOTES_DIRECTORY && pwd
        ;;
esac
