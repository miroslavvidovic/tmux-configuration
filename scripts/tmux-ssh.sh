#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Info:
#   author:    Miroslav Vidovic
#   file:      tmux-ssh.sh
#   created:   23.02.2017.-10:26:52
#   revision:  19.08.2017.
#   version:   1.1
# -----------------------------------------------------------------------------
# Requirements:
# 
# Description:
#   Detect ssh connection in tmux.
# Usage:
#   Call the script in the tmux status line.
#   #(/path/to/tmux-ssh.sh)
# -----------------------------------------------------------------------------
# Script:

check_for_ssh() {
  # Get current pane command
  local cmd
  cmd=$(tmux display-message -p "#{pane_current_command}")

  # If ssh is detected show it to the user
  if [ "$cmd" = "ssh" ] || [ "$cmd" = "sshpass" ]; then
    echo "SSH"
  else
    echo ""
  fi
}

check_for_ssh

exit 0
