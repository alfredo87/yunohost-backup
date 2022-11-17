#!/bin/bash
echo "This script is called ‘check_backup’\
 It creates a backup and removes some of the previous backups.\
\____________________________________________\
\ _________________________________
_________
___
\
Script is run in /etc/cron.daily/"
# This is the prefix for the backup files
PREFIX="automatic-"
# All backups with the previous prefix are deleted except the following dates
TODAY=`date '+%Y-%m-%d'`
YESTERDAY=`date -d "yesterday" '+%Y-%m-%d'`
DAY_BEFORE_YESTERDAY=`date -d "2 days ago" '+%Y-%m-%d'`


echo "Yunohost backup list on server before removing archives $PREFIX:"
yunohost backup list
#Create the automatic-YYYYarchive
echo "Now creating the yunohost archive $PREFIX$TODAY on the server.PLEASE WAIT >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
yunohost backup create -n $PREFIX$TODAY
cd /home/yunohost.backup/archives/
echo " ################################  Remove some archives with exceptions $PREFIX$TODAY  |$YESTERDAY   |$DAY_BEFORE_YESTERDAY  ##########################"
rm -r rm -v `ls | grep $PREFIX | grep -v -e $TODAY -e $YESTERDAY -e $DAY_BEFORE_YESTERDAY`
echo  "Removing all except these dates : $TODAY $YESTERDAY $DAY_BEFORE_YESTERDAY"
echo "Yunohost backup list on server after removing some "
yunohost backup list
echo "This section calls rsnappush and copies the new backups to the disk on the Mac. "
echo "Change $USER@$ADDRESS:$MOUNTPOINT for your own user name, IP address and mount point (/Volumes/bup)"
rsnappush  /home/yunohost.backup/archives/  $USER@$ADDRESS:$MOUNTPOINT
echo “rsnappush has moved $PREFIX$TODAY to the HDD.”
echo "There are now only $TODAY $YESTERDAY $DAY_BEFORE_YESTERDAY  archives in /home/yunohost.backup.archives.\
All others are now saved on the iMac HDD called bup"
