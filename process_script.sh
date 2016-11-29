#!/bin/sh
HOST=ftp.argis.com
USER=xxxxx
PASSWD=xxxxx

FTP_URL=ftp://services.asascience.com:2301
FTP_USER=xxxxx
FTP_PASSWD=xxxx
SHELF_DIR=MapApp/shelf-drilling-demo/app/widget/
FILE_NAME=process_rig_csv.py
CUR_FILENAME= printf '%s/%s' "$PWD" "$FILE_NAME"
printf '%s\n' "$CUR_FILENAME"

rm ShelfRigLocations.csv
rm rig_locations.json

lftp<<END_SCRIPT
open sftp://$HOST -p 22
user $USER $PASSWD
get ShelfRigLocations.csv
bye
END_SCRIPT

/Users/rpsdev/.virtualenvs/work/bin/python /Users/rpsdev/Documents/Dev/notebooks/shelf/process_rig_csv.py

lftp<<END_SCRIPT
open $FTP_URL
user $FTP_USER $FTP_PASSWD
cd $SHELF_DIR
put rig_locations.json
bye
END_SCRIPT
