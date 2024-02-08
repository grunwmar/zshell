#!/usr/bin/env zsh

PYTHON=$ZDOT/python

precmd() {
  HOSTNAME=$(python3 $PYTHON/strcut.py $ZSH_VAR_HOSTNAME_LENGTH $(hostname))
  PWD_PATH=$(python3 $PYTHON/pwd_decor.py "$PWD")
  PROMPT=$'\n'
  PROMPT+="%(!.[%F{11}root%f].%F{2}%n%f) $PWD_PATH %(!.#.%%) "

  COLS=$(tput cols)
  if [[ $COLS -ge 70 ]]; then
    RPROMPT="%(?..%F{9}%?%f) %F{4}${HOSTNAME}%f %F{14}%T%f"
    else
    RPROMPT=""
  fi
}

precmd

