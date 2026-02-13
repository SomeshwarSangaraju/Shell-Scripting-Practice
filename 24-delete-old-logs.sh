#!/bin/bash

LOGS_FOLDER="/var/log/shell"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE=$LOGS_FOLDER/$SCRIPT_NAME.log

mkdir -p $LOGS_FOLDER

SOURCE_DIR=/home/ec2-user/app-logs

if [ ! -d $SOURCE_DIR ]; then
    echo "ERROR:: $SOURCE_DIR does not exist"
    exit 1
fi

FILES_TO_DELETE=$( find $SOURCE_DIR -name "*.log" -type f -mtime +14)

while IFS read -r $filepath
do
    echo "$filepath is deleteing"
    rm -rf $filepath
done >>> $FILES_TO_DELETE