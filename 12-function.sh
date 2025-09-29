#!/bin/bash

user=$(id -u)

if [ $user -ne 0 ]; then
    echo "Please provide root previlage"
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "ERROR :: Installing $2 is failure"
        exit 1;
    else
        echo "Success :: Installing $2 is Success"
    fi
}

dnf install mysql -y
VALIDATE "$?" mysql

dnf install nginx -y
VALIDATE "$?" nginx

dnf install python3 -y
VALIDATE "$?" python3


