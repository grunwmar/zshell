#!/usr/bin/env zsh


function icon() {
    if [[ $ICONS == "true" ]]; then
      echo "$1"
      else
      echo "$2"
    fi
}


precmd() {
  tux_icon=$(icon '🪲 ' '›')
  clock_icon=$(icon '⏳ ' ' ')
  pc_icon=$(icon ' 💻 ' ' ')

  PROMPT=$'\n'
  PROMPT+="%(!.[%F{11}root%f].$tux_icon%F{2}%n%f) %F{10}%3~%f %(!.#.%%) "

  COLS=$(tput cols)
  if [[ $COLS -ge 70 ]]; then
    RPROMPT="%(?..%F{9}%?%f)$clock_icon%F{12}%T%f$pc_icon%F{4}%m%f"
    else
    RPROMPT=""
  fi
}
precmd

