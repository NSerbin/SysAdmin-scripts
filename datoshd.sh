#!/bin/bash
#Identify disk, Vendor name, Serial & WWN for all kinds of Mounted Block devices
for i in $(lsblk | grep disk | grep -E -v 'Vx|ram|raw|loop|fd|md|dm-|sr|scd|st' | awk '{ print $1 }')
do
lsblk /dev/$i | awk '{print "MOUNT="$NF}' | grep -i '/'
if [ $? = "0" ]; then
lsblk /dev/$i | grep disk | awk '{print "BLOCK_SIZE="$4}'
udevadm info --query=all --name /dev/$i | grep -E 'DEVNAME=|ID_VENDOR=|ID_SERIAL_RAW=|ID_WWN=|ID_PATH=|ID_SCSI_SERIAL=' | awk '{ print $2 }'
echo "--------------"
fi
done
