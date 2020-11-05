#!/bin/bash
ADMIN="user@mail.com"
ALERT=90
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
do
  
  usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
  partition=$(echo $output | awk '{ print $2 }' )
  if [ $usep -ge $ALERT ]; then
    echo "空间余额不足10% \"$partition ($usep%)\" on $(hostname) as on $(date)" | 
     mail -s "磁盘空间已超90%！！ $usep" $ADMIN
  fi
done