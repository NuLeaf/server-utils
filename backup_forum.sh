#!/bin/bash
# Author: Wolfgang C. Strack
# Note: Run as sudo plox

log_file='/home/nuleafte/server_util/backup_forum.log'
timestamp='date +%F_%H%M%S' # save command for multiple uses
status=0

folder_to_backup='/var/www/html/forum'
file_to_write_to="/home/nuleafte/website_backups/FORUM-BACKUP_$(date +%F_%H%M%S).tar.gz"

read -p "Back up forum files? [Y/N]: " choice
if [[ "$choice" =~ [yY]([eE][sS])*?$ ]]; then
  date >> $log_file
  sudo -n tar czf $file_to_write_to $folder_to_backup &>> $log_file
  if [[ $? == 0 ]]; then
    echo "Saved in ~/website_backups/"
    echo "backup_forum.sh ran successfully" >> $log_file
  else
    echo "Could not run tar... Are you root?"; echo
    echo "backup_forum.sh failed" >> $log_file
    status=1
  fi

  echo -e "\n\n\n" >> $log_file
fi

exit $status
