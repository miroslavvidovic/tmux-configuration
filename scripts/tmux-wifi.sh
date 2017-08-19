#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Info:
#   author:    Miroslav Vidovic
#   file:      tmux-wifi.sh
#   created:   23.02.2017.-10:58:43
#   revision:  19.08.2017.
#   version:   1.1
# -----------------------------------------------------------------------------
# Requirements: 
# 
# Description:
#   Show the wi-fi network signal quality in tmux status line.
# Usage:
#   Call the script in the tmux status line.
#   #(/path/to/tmux-wifi.sh)
# -----------------------------------------------------------------------------
# Script:

# Change the interface to your interface name
# HINT: iw dev | grep Interace
readonly INTERFACE=wlo1

get_signal(){
if [ "$(ifconfig $INTERFACE | grep UP | wc -l) -eq 1" ]; then
  link_quality="$(iwconfig $INTERFACE | grep Quality | cut -d'=' -f2 | cut -d' ' -f1 | cut -d'/' -f1)"

  SIGNAL_QUALITY=$(($link_quality * 100 / 70))

  echo wi-fi:$SIGNAL_QUALITY%
fi
}

get_signal

exit 0
