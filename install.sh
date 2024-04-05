#!/usr/bin/zsh

 # defines importt global variables
  ZDOT="$HOME/.zshell"
  ZSHRC="$HOME/.zshrc"

 # remove old ~/.zshell directory
 rm -rf $HOME/.zshell $HOME/.zshrc


  # copy new version to the .zshell dir
  cp -r ./zshell "$ZDOT"

# creates ./.zsh_auto if not exists
  if ! [[ -f $HOME/.zsh_auto ]]; then
    cp zsh_auto $HOME/.zsh_auto
    chmod +x $HOME/.zsh_auto
  fi

  # creates ~/.zsh_user if not exists
  if ! [[ -d $HOME/.zsh_user ]]; then
    mkdir $HOME/.zsh_user
  fi

  # creates ~/.zsh_user/cmds if not exists
  if ! [[ -d $HOME/.zsh_user/cmds ]]; then
    mkdir $HOME/.zsh_user/cmds
  fi

  # creates ~/.zshrc file
  echo "#!/usr/bin/env zsh" > $ZSHRC
  echo 'export ZDOT='"$ZDOT" >> $ZSHRC
  echo 'source $ZDOT/zshrc.zsh' >> $ZSHRC

  # cleaning process
  cd $HOME
  rm -rf $HOME/zshell_install
  exec $(which zsh)
