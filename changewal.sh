#!/usr/bin/bash

## Change wallpaper and adjust colors via pywal
# pywal: https://github.com/dylanaraps/pywal

wallpaperDir=$HOME/Pictures/Wallpapers/

# full path so bash can find it in other environments (pipx stuff)
$HOME/.local/bin/wal -i "$wallpaperDir"

# Change wallpaper and tell sway about it
swaymsg output "*" bg "$(cat $HOME/.cache/wal/wal)" fill
#echo "Wallpaper changed"

#
# FOOT
#
CONFIG_BASE=$HOME/.config/foot/foot.base.ini
CONFIG_OUT=$HOME/.config/foot/foot.ini
WAL_COLORS=$HOME/.cache/wal/colors-foot.ini

# Merge base config with colours generated by pywall
cat "$CONFIG_BASE" "$WAL_COLORS" > "$CONFIG_OUT"
#echo "foot config updated"

# 
# WAYBAR
#
CONFIG_BASE=$HOME/.config/waybar/style.base.css
CONFIG_OUT=$HOME/.config/waybar/style.css
WAL_COLORS=$HOME/.cache/wal/waybar.css

# Merge
cat "$WAL_COLORS" "$CONFIG_BASE" > "$CONFIG_OUT"
pkill waybar && waybar &    # reload waybar
#echo "waybar config updated"


# 
# TOFI
#
CONFIG_BASE=$HOME/.config/tofi/base-config
CONFIG_OUT=$HOME/.config/tofi/config
WAL_COLORS=$HOME/.cache/wal/tofi-colors

# Merge
cat "$WAL_COLORS" "$CONFIG_BASE" > "$CONFIG_OUT"
#echo "tofi config updated"

# 
# MAKO
#
CONFIG_BASE=$HOME/.config/mako/config.base
CONFIG_OUT=$HOME/.config/mako/config
WAL_COLORS=$HOME/.cache/wal/colors-mako

# Merge
cat "$WAL_COLORS" "$CONFIG_BASE" > "$CONFIG_OUT"
pkill mako && mako &
#echo "mako config updated"

# Send notification
notify-send "Wallpaper changed" "colours updated"
