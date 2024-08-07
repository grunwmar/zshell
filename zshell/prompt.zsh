#!/usr/bin/env zsh

PYTHON=$ZDOT/python

precmd() {


  COLS=$(tput cols)

  if [[ -n $VIRTUAL_ENV_PROMPT ]]; then
         VPROMPT=${${VIRTUAL_ENV_PROMPT:gs/)/}:gs/(/}
         VPROMPT=${(MS)VPROMPT##[[:graph:]]*[[:graph:]]}
         VPROMPT=":%F{12}"$VPROMPT"%f "
  else
      	VPROMPT=""
  fi


  if [[ -f ".git/HEAD" ]]; then
        git_head=$(cat .git/HEAD)
        git_head=$(basename $git_head)
        git_head="|%F{11}$git_head%f"
  else
      	git_head=""
  fi

  PROMPT_NL=$'\n'
  PROMPT=$PROMPT_NL


  if [[ $COLS -ge 80 ]]; then
    RPROMPT="[@%F{6}%m%f "
    RPROMPT+=""$VPROMPT""%F{10}%T%f
    RPROMPT+="]"

    PROMPT+="[%(!.%F{11}root%f .)%F{14}%n%f%F{6}%f:%F{10}%3~%f$git_head]%(!.#.%%) "
    else
    RPROMPT=""
    PROMPT+="%F{8}@%m%f"${PROMPT_NL}
    PROMPT+="[%(!.%F{11}root%f .)%F{14}%n%f%F{6}%f:%F{10}%3~%f]${PROMPT_NL}[%F{10}%T%f]%(!.#.%%) "
  fi


}





precmd

