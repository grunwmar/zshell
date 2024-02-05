#!/usr/bin/env zsh


function icon() {
    if [[ $ICONS == "true" ]]; then
      echo "$1"
    fi
}

tux_icon=$(icon '🐧 ')
folder_icon=$(icon '📂 ')
dollar_icon=$(icon ' 💲')
clock_icon=$(icon '🕐 ')
pc_icon=$(icon '💻 ')
crown_icon=$(icon '👑')

PROMPT=$'\n'
PROMPT+="%(!.[$crown_icon%F{11}root%f].$tux_icon%F{14}%n%f) $folder_icon%F{10}%3~%f "

RPROMPT="%(?.. %F{9}%?%f) $clock_icon%F{12}%T%f $pc_icon%F{4}%m%f"
