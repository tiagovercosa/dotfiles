#!/bin/bash
picom -b --config ~/.config/picom/picom.conf &
xset r rate 300 50 &
redshift -l -8.01:-34.90 -t 5700:3600 -g 0.8 -m randr &
setxkbmap br &
nm-applet --indicator &
dunst &
xss-lock -l -- $HOME/.local/bin/myi3lock &
