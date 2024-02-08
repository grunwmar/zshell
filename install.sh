#!/bin/sh

  ZDOT="$HOME/.zshell"
  ZSHRC="$HOME/.zshrc"

  echo -n "Remove old .zshrc and .zshell file and directory (required for install)? [y/N] "
  read answ

  case $answ in
    y|Y|yes)
      rm -rf $HOME/.zshell $HOME/.zshrc
    ;;
    *)
      echo "Exiting..."
      exit
    ;;
  esac
  cp -r ./zshell "$ZDOT"

  echo "#!/usr/bin/env zsh" > $ZSHRC
  echo 'export ZDOT='"$ZDOT" >> $ZSHRC
  echo 'source $ZDOT/zshrc.zsh' >> $ZSHRC

  cd $HOME
  rm -rf $HOME/zshell_install
  exec $(which zsh)