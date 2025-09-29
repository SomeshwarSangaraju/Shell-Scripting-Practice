#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo -e "$G Hello World $N"
echo "Check this color"

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOG_FILE/$SCRIPT_NAME.log"

mkdir -p $LOG_FOLDER

echo "Script started executed at :$(date)" | tee -a $LOG_FILE


user=$(id -u)

if [ $user -ne 0 ]; then
    echo " ERROR:: Please provide root previlage"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "ERROR :: Installing $2 is $R failure" $N| tee -a $LOG_FILE
        exit 1;
    else
        echo -e "SUCCESS:: Installing $2 is $G success" $N | tee -a $LOG_FILE
    fi
}

EXISTORNOT(){
    if [ $? -ne 0 ]; then
        dnf install $1 -y &>>$LOG_FILE
        VALIDATE $? $1
    else
        echo -e "$1 is already installed $Y Skipping $N" | tee -a $LOG_FILE
    fi
}

dnf list installed $1 &>>$LOG_FILE
EXISTORNOT

