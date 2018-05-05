#!/bin/bash

if [ ! -d /backup ]; then
	mkdir /backup
fi

if [ $(date +%d) -eq 01 ];then
	rm -rf /backup/snapshot.snar

	for file in $(find /backup|grep .tar.gz|grep -v 01.tar.gz);
	do
		rm -rf $file
	done

	##disk BOOM! debug:only 5 months (150 days)
	find /backup -mtime +150 -type f -name '*.tar.gz' -exec rm -rf {} \;	
fi

tar -czpf /backup/backup_$(date +%Y%m%d).tar.gz -g /backup/snapshot.snar --exclude=/backup --exclude=/proc --exclude=/lost+found --exclude=/sys --exclude=/mnt --exclude=/media --exclude=/dev --exclude=/tmp /  > /dev/null 2>&1

echo $(date )+'     SUCCESS.' >> /backup/backuplog
