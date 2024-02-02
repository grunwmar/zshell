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
  git clone https://github.com/grunwmar/zshell.git zshell_install
  cd ./zshell_install
  sh ./install.sh install
  cd ..
  rm -rf ./zshell_install
fi