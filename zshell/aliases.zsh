#!/usr/bin/env zsh

alias vim="nvim"
alias ed="vim"

alias tmux="tmux -f $ZDOT/configs/tmux.conf"

if [[ $ZSH_VAR_LS_COLORS == "True" ]]; then
  alias ls="ls -p --color=always"
else
  alias ls="ls -p --color=never"
fi

alias la="ls -Ap"
alias ll="ls -lAhp"