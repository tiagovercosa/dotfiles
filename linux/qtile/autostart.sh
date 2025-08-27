#!/usr/bin/env sh

xset r rate 300 50 &
xset +dpms s 60 180 &
redshift -l -7.15:-34.84 -t 6500:4500 -g 0.8 -m randr &
/usr/lib/polkit-kde-authentication-agent-1 &
/usr/bin/dropbox &
blueman-applet &
$HOME/.local/bin/screen &
nm-applet &
dunst -conf ${HOME}/.config/dunst/dunstrc &
picom -b --log-file $HOME/.local/share/picom/picom.log --config ${HOME}/.config/picom/picom.conf --vsync &
