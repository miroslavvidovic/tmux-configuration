#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Info:
#   author:    Miroslav Vidovic (miroslav-vidovic@hotmail.com)
#   file:      ftpane.sh
#   created:   12.07.2018.-15:36:54
#   revision:
#   version:   1.0
# -----------------------------------------------------------------------------
# Requirements:
#   fzf - https://github.com/junegunn/fzf
# Description:
#   use fzf  to select a tmux pane
# Usage:
#   Add the script to your system path. Add a keybinding in your tmux.conf to
#   call the script
#
#   bind-key 0 run "tmux split-window -l 12 'bash -ci ftpane.sh'"
# -----------------------------------------------------------------------------
# Script:

main(){
  # ftpane - switch tmux pane
  panes=$(tmux list-panes -s -F '#I:#P #W #{pane_current_path} #{pane_current_command} #{pane_title}')
  current_window=$(tmux display-message  -p '#I')

  target=$(echo "$panes" | fzf) || return

  target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
  target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)

  if [[ $current_window -eq $target_window ]]; then
      tmux select-pane -t ${target_window}.${target_pane}
  else
    tmux select-pane -t ${target_window}.${target_pane} &&
    tmux select-window -t $target_window
  fi
}

main

exit 0
