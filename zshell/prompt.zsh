#!/usr/bin/env zsh

PYTHON=$ZDOT/python
function icon() {
    if [[ $ICONS == "true" ]]; then
      echo "$1"
      else
      echo "$2"
    fi
}


precmd() {

  HOSTNAME=$(python3 $PYTHON/strcut.py $ZSH_VAR_HOSTNAME_LENGTH $(hostname))
  PWD_PATH=$(python3 $PYTHON/pwd_decor.py "$PWD" $ZSH_VAR_PATH_SHOW_DEPTH 15 10)
  PROMPT=$'\n'
  PROMPT+="%(!.[%F{11}root%f].›%F{2}%n%f) $PWD_PATH %(!.#.%%) "

  COLS=$(tput cols)
  if [[ $COLS -ge 70 ]]; then
    RPROMPT="%(?..%F{9}%?%f) %F{4}${HOSTNAME}%f %F{6}%T%f"
    else
    RPROMPT=""
  fi
}

precmd

