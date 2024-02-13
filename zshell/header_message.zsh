#!/usr/bin/env zsh
function header_message () {
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
}