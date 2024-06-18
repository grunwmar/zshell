#!/usr/bin/env zsh

PYTHON=$ZDOT/python

precmd() {


  COLS=$(tput cols)

  if [[ -n $VIRTUAL_ENV_PROMPT ]]; then
         VPROMPT=:${${VIRTUAL_ENV_PROMPT:gs/)/}:gs/(/}
  else
      	VPROMPT=""
  fi


  if [[ -f ".git/HEAD" ]]; then
        git_head=$(cat .git/HEAD)
        git_head=$(basename $git_head)
        git_head="[%F{11}$git_head%f]"
  else
      	git_head=""
  fi


  PROMPT=$''
  PROMPT+="%(!.[%F{11}root%f] .)%F{10}%3~%f$git_head%(!.#.%%) "


  if [[ $COLS -ge 70 ]]; then
    RPROMPT="%F{14}$VPROMPT%f%(?..%F{9}%? %f)%n@%m %F{10}%T%f"
    else
    RPROMPT="%F{14}$VPROMPTT%f%n"
  fi
}

precmd

