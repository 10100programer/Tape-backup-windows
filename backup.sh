#!/bin/sh
#backup Windows to tape
## make sure to load the correct tape before you run this script ##
## If the backup size is larger then the tape it should prompt you when you must Insert a new tape ##

## DATE FORMAT ##
NOW=$(date +"%b-%d-%Y-%I-%M")
Month=$(date +"%B")
year=$(date +"%Y")

## TAPE PATH ##
TAPE="/dev/st0"

## Check Premisions ##
if [ ! "`whoami`" = "root" ]
then
    echo "\nPlease run script as root."
    exit 1
fi

## REWIND TAPE ##
echo "rewinding TAPE"
mt -f $TAPE rewind

## Change Directory to Backup folder ##
echo "changing directory to Windows Samba Backup Folder"
cd /media/main/backup/THOR

## Add Timestamp to to /WindowsImageBackup/DATE.txt
echo "Backup to tape Started on $NOW" > WindowsImageBackup/DATE.txt

## Run Tar to backup ##
echo "starting backup"
tar -cvpf $TAPE WindowsImageBackup/ --checkpoint=5000 --multi-volume
echo "backup completed please goto $TAPE to verify the backup"
exit
## EOF ##
