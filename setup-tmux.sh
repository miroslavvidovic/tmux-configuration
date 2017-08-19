#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Info:
#   author:    Miroslav Vidovic
#   file:      setup-tmux.sh
#   created:   01.04.2016.-11:45:17
#   revision:  19.08.2017.
#   version:   1.1
# -----------------------------------------------------------------------------
# Requirements:
#   tmux, git
# Description:
#   Set up tmux, tmuxinator and tmux package manager
#       - copy .tmux.conf to $HOME/.tmux.conf
#       - copy .tmuxniator dir to $HOME/.tmuxinator
#       - clone tpm repository to $HOME/.tmux/plugins/tpm
# Usage:
#   setup-tmux.sh
# -----------------------------------------------------------------------------
# Script:

# Check if installed
is_installed() {
  if ! type "$1" 2> /dev/null; then
    return 1
  else
    return 0
  fi
}

set_up_tmux() {
  if is_installed tmux ; then
    echo " => tmux configuration"
    cp -i tmux.conf ~/.tmux.conf
  else
    echo "Tmux not installed. Install tmux first."
  fi
}

set_up_tmuxinator() {
  if is_installed tmuxinator ; then
    mkdir -p "$HOME"/.tmuxinator
    echo " => tmuxinator configuration"
    cp -ir tmuxinator/*  "$HOME"/.tmuxinator
  else
    echo "Tmuxinator not installed. Install tmuxinator first."
  fi
}

set_up_tpm() {
  # Clone or update the tmux package manager
  local repo=~/.tmux/plugins/tpm
  if is_installed git; then
    if cd "$repo"; then
      echo " => updating tpm"
      git pull 
    else
      echo " => installing tpm"
      git clone https://github.com/tmux-plugins/tpm "$repo" 
    fi
  else
    echo "Git is not installed install git first."
  fi
}

main() {
  set_up_tmux
  set_up_tmuxinator
  set_up_tpm
  echo "Done"
}

main 

exit 0
