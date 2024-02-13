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
source $ZDOT/esntl_aliases.zsh
source $ZDOT/prompt.zsh


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
USER=$(whoami)
HOSTNAME=$(hostname)
echo ""
echo -e "   \e[37m$(date)\e[0m"
echo ""
if [[ -n $USER$HOSTNAME ]]; then
  echo -e "   \e[37muser:  \e[96m$USER\e[37m@\e[94m$HOSTNAME\e[0m"
fi
echo -e "   \e[37mshell: \e[94m$SHELL\e[0m"
echo ""
IFS_OLD=$IFS
IFS=$'\n'
for line in ${(f)"$(<$ZDOT/welcome_screen.txt)"}; do
    echo -e "   $line \e[0m"
done

if [[ -f "$PWD/.auto" ]] && [[ $ZSH_VAR_DIR_AUTORUN == "True" ]]; then
  zsh "$PWD/.auto"
fi