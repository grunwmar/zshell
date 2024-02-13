#!/usr/bin/env zsh

alias tmux="tmux -f $ZDOT/configs/tmux.conf"

if [[ $ZSH_VAR_LS_COLORS == "True" ]]; then
  alias ls="ls -p --color=always"
else
  alias ls="ls -p --color=never"
fi

function cdauto () {
  if [[ -z ".auto" ]]; then
    case "$1" in
      "")
        cd $HOME
      ;;

      *)
        cd "$1"
      ;;
    esac
    zsh .auto
  fi
}

alias cd=cdauto