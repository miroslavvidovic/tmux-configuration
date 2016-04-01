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

# Copy tmux conf
cp -i tmux.conf ~/.tmux.conf

# Copy all tmuxinator files
cp tmuxinator/* ~/.tmuxinator

exit 0
