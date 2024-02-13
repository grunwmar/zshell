#!/usr/bin/env zsh

alias tmux="tmux -f $ZDOT/configs/tmux.conf"

if [[ $ZSH_VAR_LS_COLORS == "True" ]]; then
  alias ls="ls -p --color=always"
else
  alias ls="ls -p --color=never"
fi

function cdauto () {

    case "$1" in
      "")
        cd $HOME
      ;;

      *)
        cd "$1"
      ;;
    esac
  if [[ -f "$PWD/.auto" ]]; then
    zsh "$PWD/.auto"
  fi
}

alias cd=cdauto

function zupd () {
  case "$1" in
    "-H")
        cd $HOME
        rm -rf .zsh*
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/grunwmar/zshell/main/web_install.sh)"
      ;;
    *)
    ;;
  esac
}
