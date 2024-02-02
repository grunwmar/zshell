#!/bin/sh

if [[ $1 == "install" ]]; then
  ZDOT="$HOME/.zshell"
  ZSHRC="$HOME/.zshrc"

  cp -r ./zshell "$ZDOT"

  echo "#!/usr/bin/env zsh" > $ZSHRC
  echo 'export ZDOT='"$ZDOT" >> $ZSHRC
  echo 'source $ZDOT/zshrc.zsh' >> $ZSHRC
else
  cd $HOME
  git clone https://github.com/grunwmar/zshell.git $HOME/zshell_install
  cd $HOME/zshell_install
  sh ./install.sh install
  cd $HOME
  rm -rf $HOME/zshell_install
fi