#!/bin/bash
# Author: Wolfgang C. Strack
# This script should be run as sudo and regularly (at least once a week).
# DO NOT include this script in .bashrc until it's robust enough.

space_out='echo;echo;echo'

echo "Now running server administration routines..."; eval $space_out

read -p "Run apt-get update and upgrade? [Y/N]: " choice
if [[ "$choice" =~ [yY]([eE][sS])*?$ ]]; then
  sudo -n apt-get update && sudo -n apt-get upgrade
else
  echo "N/n or an invalid choice was entered. Exiting..."
fi

eval $space_out

timestamp='date +%F_%H%M%S' # save command for multiple uses

read -p "Back up main website files? [Y/N]: " choice
if [[ "$choice" =~ [yY]([eE][sS])*?$ ]]; then
  # TODO:
  # tar czf "MAIN-WEBSITE-BACKUP_$(eval $timestamp).tar.gz" (files)
  # mv -t ~/ MAIN-WEBSITE-BACKUP_*.tar.gz
  echo "Saved in ~/"
fi

eval $space_out

read -p "Back up forum files? [Y/N]: " choice
if [[ "$choice" =~ [yY]([eE][sS])*?$ ]]; then
  # TODO:
  # tar czf "FORUM-BACKUP_$(eval $timestamp).tar.gz" (files)
  # mv -t ~/ FORUM-BACKUP_*.tar.gz
  echo "Saved in ~/"
fi
