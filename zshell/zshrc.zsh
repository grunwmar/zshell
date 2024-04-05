#!/usr/bin/env zsh

# set important globals
export SHELL=$(which zsh)
export ZCMD=$ZDOT/cmds
export ZUSER=$HOME/.zsh_user

# sourcing important modules
source $ZDOT/history.zsh
source $ZDOT/esntl_aliases.zsh
source $ZDOT/aliases.zsh
source $ZDOT/prompt.zsh


if [[ -d $ZUSER ]]; then

  # checking if user def source file exists, if true then sources it
  if [[ -f $ZUSER/__source__ ]]; then
    source $ZUSER/__source__
  fi

  # checking if user def executable file exists, if true then executes it
  if [[ -f $ZUSER/__execute__ ]]; then
    zsh $ZUSER/__execute__
  fi
fi

# command to reexec z-shell
function rezsh () {
	clear
	exec zsh
}

# quick access to edit certain files
function edit_n_reload () {
	ed "$1"
	rezsh
}

alias @zshrc="edit_n_reload $ZDOT/zshrc.zsh"
alias @aliases="edit_n_reload $ZDOT/aliases.zsh"
alias @prompt="edit_n_reload $ZDOT/prompt.zsh"
alias @ucmds="cd $ZUSER/cmds"

# add ~/.zshell/cmds to path
if [[ -d $ZCMD ]]; then
  export PATH="$ZCMD:$PATH"
fi

# add ~/.zsh_user/cmds to path
if [[ -d $ZUSER/cmds ]]; then
  export PATH="$ZUSER/cmds:$PATH"
fi

# runs .zsh_auto file in dir when zsh starts
run_auto