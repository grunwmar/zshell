#!/bin/sh

ZDOT="$HOME/.zshell/"
ZSHRC="$HOME/.zshrc"

cp -r ./zshell "$ZDOT"

echo "#!/usr/bin/env zsh" > $ZSHRC
echo 'export ZDOT='"$ZDOT" >> $ZSHRC
echo 'source $ZDOT/zshrc.zsh'