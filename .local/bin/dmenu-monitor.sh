#! /bin/bash

ask="Qual monitor?"
opt="1. Interno\n2. Externo\n3. Lado a lado"
red="#8A2A0B"
azul="#0088CC"

ask() {
    answer="$( echo -e $1 | dmenu -fn 'FantasqueSansMono Nerd Font-13 #999' -nb '#292d3e' -sf '#eee' -sb "$azul" -p "$2" -l 3)"
}

ask "$opt" "$ask"

case $answer in
    "1. Interno")
        if [[ $answer == "1. Interno" ]]; then
            ${HOME}/.screenlayout/mobile.sh && ${HOME}/.fehbg
        fi
        exit 0
        ;;
    "2. Externo")
        if [[ $answer == "2. Externo" ]]; then
            ${HOME}/.screenlayout/docked-home.sh && ${HOME}/.fehbg
        fi
        exit 0
        ;;
    "3. Lado a lado")
        if [[ $answer == "3. Lado a lado" ]]; then
            ${HOME}/.screenlayout/side-by-side.sh && ${HOME}/.fehbg
        fi
        exit 0
        ;;
esac

exit 0
