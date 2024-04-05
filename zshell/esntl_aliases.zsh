#!/usr/bin/env zsh

# add tmux configuration
alias tmux="tmux -f $ZDOT/configs/tmux.conf"

# if run in dir and .zsh_auto is present, runs it
function run_auto() {
    if [[ -f "$PWD/.zsh_auto" ]]; then
    "$PWD/.zsh_auto"
  fi
}

# upgrading cd command to run run_auto when dir changed
function cdauto () {

    case "$1" in
      "")
        cd $HOME
      ;;

      *)
        cd "$1"
      ;;

    esac
  run_auto
}

alias cd=cdauto

function zshellupdate () {
        cd $HOME
        rm -rf .zsh*
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/grunwmar/zshell/main/web_install.sh)"
}
