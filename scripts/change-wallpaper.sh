#!/usr/bin/env sh

# Sets background wallpaper of X display :0 to a random JPG file chosen from
# the directory `~/img/wallpaper`.

DISPLAY=:0 feh --no-fehbg --bg-fill --randomize $HOME/img/wallpaper/*.jpg
