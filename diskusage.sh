#!/bin/sh
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
do
  echo $output
  used=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
  partition=$(echo $output | awk '{ print $2 }' )
  if [ $used -ge 95 ]; then
    echo "The partition \"$partition\" on $(hostname) has used $used% at $(date)" | mail -s "Disk space alert: $used% used" nicolas.serbin@gmail.com
  fi
done
