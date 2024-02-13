#!/usr/bin/env zsh

alias vim="nvim"
alias ed="vim"

alias la="ls -Ap"
alias ll="ls -lAhp"

function cl() {
    cd "$1"
    ls
}