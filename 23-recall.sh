#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "Please run the script with root previlage"
    exit 11;
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "$2 Installing failure"
        exit 1
    else 
        echo "$2 Installing success"
    fi
}



for package in $*
do 
    $package
done


