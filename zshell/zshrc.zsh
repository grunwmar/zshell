#!/usr/bin/env zsh

if [[ -z $ZDOT ]]; then
  ZDOT="$HOME/.zshell"
fi

source $ZDOT/history.zsh
source $ZDOT/aliases.zsh
source $ZDOT/prompt.zsh

function rezsh () {
	clear
	exec zsh
}

function edit_n_reload () {
	ed "$1"
	rezsh
}

alias @zshrc="edit_n_reload $ZDOT/../zshrc.zsh"
alias @aliases="edit_n_reload $ZDOT/aliases.zsh"
alias @prompt="edit_n_reload $ZDOT/prompt.zsh"

clear
echo ""
echo -e "   \e[37m$(date)\e[0m"
echo ""
if [[ -n $USER$HOSTNAME ]]; then
  echo -e "   \e[37muser:  \e[96m$USER\e[37m@\e[94m$HOSTNAME\e[0m"
fi
echo -e "   \e[37mshell: \e[94m$SHELL\e[0m"
