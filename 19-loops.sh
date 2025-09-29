#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$( id -u )

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOG_FILE/$SCRIPT_NAME.log"

mkdir -p $LOG_FOLDER

echo "Script started executed at :$(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
    echo "ERROR:: please run the script with root previlage"
    exit 1;
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "ERROR :: Installing $2 is $R failure" $N| tee -a $LOG_FILE
        exit 1;
    else
        echo -e "SUCCESS:: Installing $2 is $G success" $N | tee -a $LOG_FILE
    fi
}


for package in $@
do
    dnf list install $package &>>LOG_FILE
    if [ $? -ne 0 ]; then
        dnf install $package -y
        VALIDATE $? $package
    else
        echo "SUCCESS :: $package is already exist $Y SKIPPING $N" 
    fi
done

