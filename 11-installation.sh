#!/bin/bash

User=$(id -u)
User1=$(id -g)

echo "$User"
echo "$User1"

if [ $User -ne 0 ]; then
    echo "Please provide root access"
fi

dnf install mysql -y

if [ $User -ne 0]; then
    echo "Installing mysql is failure"
else
    echo "Installing mysql is success"
fi
