#!/bin/bash

if [ $(date +%d) -eq 01 ];then
	rm -rf /backup/snapshot.snar

	for file in $(find /backup|grep .tar.gz|grep -v 01.tar.gz);
	do
		rm -rf $file
	done
fi

tar -czpf /backup/backup_$(date +%Y%m%d).tar.gz -g /backup/snapshot.snar --exclude=/backup --exclude=/proc --exclude=/lost+found --exclude=/sys --exclude=/mnt --exclude=/media --exclude=/dev --exclude=/tmp /  > /dev/null 2>&1

echo $(date )+'     SUCCESS.' >> /backup/backuplog
