#! /bin/bash

ask="Qual monitor?"
opt="1. Interno\n2. Externo\n3. Lado a lado"
red="#8A2A0B"
azul="#0088CC"
green="#26A69A"
nord="#81a1c1"

ask() {
  answer="$( echo -e $1 | dmenu -fn 'Hack Nerd Font-10 #999' -nb '#1a1b26' -sf '#ffffff' -sb "#005577" -p "$2" -l 3)"
}

ask "$opt" "$ask"

case $answer in
  "1. Interno")
    if [[ $answer == "1. Interno" ]]; then
      swaymsg output eDP-1 enable && swaymsg output HDMI-A-1 disable && dunstify -I /usr/share/icons/oxygen/base/48x48/devices/video-display.png -i Display "Perfil de Monitor" "Interno"
    fi
    exit 0
    ;;
  "2. Externo")
    if [[ $answer == "2. Externo" ]]; then
       swaymsg output eDP-1 disable && swaymsg output HDMI-A-1 enable && dunstify -I /usr/share/icons/oxygen/base/48x48/devices/video-display.png -i Display "Perfil de Monitor" "Externo"
    fi
    exit 0
    ;;
  "3. Lado a lado")
    if [[ $answer == "3. Lado a lado" ]]; then
       swaymsg output eDP-1 enable && swaymsg output HDMI-A-1 enable && dunstify -I /usr/share/icons/oxygen/base/48x48/devices/video-display.png -i Display "Perfil de Monitor" "Lado a Lado"
    fi
    exit 0
    ;;
esac

exit 0
