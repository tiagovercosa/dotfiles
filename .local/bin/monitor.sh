#!/bin/bash

inter=eDP1
exter=HDMI1

if xrandr | grep "$exter disconnected"; then
  xrandr --output eDP1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output DP1 --off --output HDMI1 --off --output VIRTUAL1 --off && nitrogen --restore
else
  xrandr --output eDP1 --off --output DP1 --off --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off && nitrogen --restore
fi
