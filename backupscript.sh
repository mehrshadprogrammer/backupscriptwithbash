#!/bin/bash

function error_message(){
	echo "$1" >&2
}


read -p "Enter the path to the file that you to backup: " BACKUP_PATH
backup(){
	if [ -f $1 ];then
		mkdir -p /tmp/backup
		local BACKUP_PATH="/tmp/backup/$(basename ${1}).$(date +%F).${$}.bk"
		echo "backing up $1 to ${BACKUP_PATH}"
		cp $1 $BACKUP_PATH
		return 0
	else
		error_message "error creating backup"
#		echo "Error create backup" 
		return 1
	fi
}
backup $BACKUP_PATH

if [ $? -eq 0 ];then
	echo "back up successfully"
  exit 0
else
	echo "Error">&2
 exit 1
fi
