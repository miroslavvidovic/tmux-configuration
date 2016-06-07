#!/bin/bash

# -------------------------------------------------------
# Info:
# 	Miroslav Vidovic
# 	setup_tmux.sh
# 	01.04.2016.-11:45:17
# -------------------------------------------------------
# Description:
#  Script to setup tmux files. Copy .tmux.conf to home
#  and tmuxinator files to .tmuxinator directory.
# Usage:
#
# -------------------------------------------------------
# Script:

# Check for tmuxinator
# If a program  is installed return 0
# and if not return 1
# Function takes the program name as the first parameter

is_installed() {
  if ! type "$1" 2> /dev/null; then
      return 1
  else
      return 0
    fi
}

# Copy tmux conf
if is_installed tmux ; then
  cp -i tmux.conf ~/.tmux.conf
else
  echo "Tmux not installed. Install tmux first."
fi

# Copy all tmuxinator files
if is_installed tmuxinator ; then
  cp -ir tmuxinator  ~/
else
  echo "Tmuxinator not installed. Install tmuxinator first."
fi

exit 0
