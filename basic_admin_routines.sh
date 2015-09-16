#!/bin/bash
# Author: Wolfgang C. Strack
# This script should be run regularly (at least once a week).
# DO NOT include this script in .bashrc until it's robust enough.

space_out='echo;echo;echo'

echo "Now running server administration routines..."; eval $space_out

read -p "Run apt-get update and upgrade? [Y/N]: " choice
if [[ "$choice" =~ [yY]([eE][sS])*?$ ]]; then
  sudo -n apt-get update && sudo -n apt-get upgrade
else
  echo "N/n or an invalid choice was entered. Exiting..."
fi
