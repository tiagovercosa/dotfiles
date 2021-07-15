#!/usr/bin/env bash

first_prompt="O que você quer?"
opt1="1. Reiniciar\n2. Desligar"
opt2="Sim\nNão"
cor1="#0077bb"
azul="#0088CC"
red="#8A2A0B"
green="#26A69A"

ask() {
    answer="$( echo -e $1 | dmenu -i -p "$2" -fn 'FantasqueSansMono Nerd Font-13 #999' -nb '#292d3e' -sf '#000' -sb "$green" -l 2 )"
}

ask "$opt1" "$first_prompt"

case $answer in
    "1. Reiniciar")
        ask "$opt2" "Quer mesmo reiniciar o sistema?"
        if [[ $answer == "Sim" ]]; then
            systemctl reboot
        fi
        exit 0
        ;;
    "2. Desligar")
        ask "$opt2" "Quer mesmo desligar o computador?"
        if [[ $answer == "Sim" ]]; then
            systemctl poweroff
        fi
        exit 0
        ;;
esac

exit 0
