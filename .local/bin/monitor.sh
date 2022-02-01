#!/bin/bash

# if xrandr --listmonitors | grep HDMI1; then
#   xrandr --output eDP1 --off --output DP1 --off --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
# fi

if swaymsg -t get_outputs | grep HDMI-A-1; then
  swaymsg output eDP-1 disable
fi
