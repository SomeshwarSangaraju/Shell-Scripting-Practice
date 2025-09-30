#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "Please run the script with root previlage"
    exit 11;
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        dnf install $2 -y
        exit 1
    else 
        echo "$2 is already exist"
    fi
}

dnf list installed mysql
VALIDATE $? "mysql"

for package in $*
do 
    $package
done


