#!/usr/bin/env zsh

PYTHON=$ZDOT/python

precmd() {

  PROMPT=$''
  PROMPT+="%(!.[%F{11}root%f] .)%F{10}%3~%f%(!.#.%%) "

  COLS=$(tput cols)

  if [[ $COLS -ge 70 ]]; then
    RPROMPT="%F{14}$VIRTUAL_ENV_PROMPT%f%(?..%F{9}%? %f)%F{7}%n@%m%f %F{10}%T%f"
    else
    RPROMPT="%F{14}$VIRTUAL_ENV_PROMPT%f%n"
  fi
}

precmd

