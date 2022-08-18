#!/bin/env bash

# Options for powermenu
lock="    Lock"
logout="    Logout"
shutdown="    Shutdown"
reboot="    Reboot"
sleep="   Sleep"
hibernate="    Hibernate"

# Get answer from user via rofi
selected_option=$(echo "$lock
$logout
$sleep
$hibernate
$reboot
$shutdown" | rofi -dmenu\
                  -i\
                  -p "Power"\
                  -config "~/.config/rofi/powermenu.rasi"\
                  -font "Cascadia Code 12"\
                  -width "15"\
                  -lines 5\
                  -line-margin 3\
                  -line-padding 10\
                  -scrollbar-width "0" )

# Do something based on selected option
if [[ "$ selected_option " == "$lock" ]]; then
    echo "No match"
    #/home/$USER/.config/scripts/i3lock-fancy/i3lock-fancy.sh
elif [[ "$selected_option" == "$logout" ]]; then
    i3-msg exit
    #loginctl terminate-user `whoami`
elif [[ "$selected_option" == "$hibernate" ]]; then
    systemctl hibernate
elif [[ "$selected_option" == "$shutdown" ]]; then
    systemctl poweroff
elif [[ "$selected_option" == "$reboot" ]]; then
    systemctl reboot
elif [[ "$selected_option" == "$sleep" ]]; then
    systemctl suspend
else
    echo "No match"
fi

