#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$( id -u )

if [ $USERID -ne 0 ]; then
    echo "ERROR:: please run the script with root previlage"
    exit 1;
fi

# if [ $? -ne 0 ]; then
#     echo "ERROR :: Installing $1 is $R FAILURE $N"
#     exit 1
# else
#     echo "Installing $1 is $G Success $N"
# fi

dnf install mysql -y

