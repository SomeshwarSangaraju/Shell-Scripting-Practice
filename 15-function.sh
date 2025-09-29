#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo -e "$G Hello World $N"
echo "Check this color"

user=$(id -u)

if [ $user -ne 0 ]; then
    echo "Please provide root previlage"
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "ERROR :: Installing $2 is failure"
        exit 1;
    else
        echo "SUCCESS:: Installing $2 is success"
    fi
}

INSTALLED(){
    if [ $? -ne 0 ]; then
        dnf install $1 -y
        VALIDATE $? $1
    else
        echo -e "MYSQL is already installed $Y Skipping $N"
    fi
}

dnf list installed mysql
INSTALLED "$1"


# dnf list installed nginx
# if [ $? -ne 0 ]; then
#     dnf install nginx -y
#     VALIDATE $? nginx
# else
#     echo -e "NGINX is already installed $Y Skipping $N"
# fi

# dnf list installed python3
# if [ $? -ne 0 ]; then
#     dnf install python3 -y
#     VALIDATE $? python3
# else
#     echo -e "PYTHON is already installed $Y Skipping $N"
# fi
