#!/usr/bin/env zsh

export SHELL=$(which zsh)

export ZVARFILE=$ZDOT/var/env.json
export DOT_ZVARFILE=$ZDOT/var/.env

function loadvars() {
    if python3 $ZDOT/python/load_variables.py; then
      source $DOT_ZVARFILE
    fi
}
loadvars

source $ZDOT/history.zsh
source $ZDOT/esntl_aliases.zsh
source $ZDOT/aliases.zsh
source $ZDOT/prompt.zsh
source $ZDOT/header_message.zsh

function rezsh () {
	clear
	exec zsh
}

function edit_n_reload () {
	ed "$1"
	rezsh
}

alias @zshrc="edit_n_reload $ZDOT/zshrc.zsh"
alias @aliases="edit_n_reload $ZDOT/aliases.zsh"
alias @prompt="edit_n_reload $ZDOT/prompt.zsh"
alias @zenv="edit_n_reload $ZDOT/var/env.json"

clear