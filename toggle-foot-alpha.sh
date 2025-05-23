#!/usr/bin/bash

CONFIG_FILE="$HOME/.config/foot/foot.ini"

# Check if config file exists
if [[ ! -f "$CONFIG_FILE" ]]; then
  echo "Config file not found at $CONFIG_FILE"
  exit 1
fi

# Toggle alpha value
if grep -qE "^alpha *= *0\.85" "$CONFIG_FILE"; then
  # Change 0.9 to 1
  sed -i 's/^alpha *= *0\.85/alpha = 1/' "$CONFIG_FILE"
  echo "Alpha set to 1 (opaque)"
elif grep -qE "^alpha *= *1" "$CONFIG_FILE"; then
  # Change 1 to 0.9
  sed -i 's/^alpha *= *1/alpha = 0.85/' "$CONFIG_FILE"
  echo "Alpha set to 0.85 (transparent)"
else
  echo "No recognizable alpha setting found."
  exit 2
fi

