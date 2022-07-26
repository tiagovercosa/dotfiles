#!/usr/bin/env sh

nitrogen --restore &
picom -b --config ~/.config/picom/picom.conf --vsync &
xset r rate 300 50 &
redshift -l -7.15:-34.84 -t 5700:4000 -g 0.8 -m randr &
/usr/lib/polkit-kde-authentication-agent-1 &
dunst -conf ~/.config/dunst/dunstrc &
