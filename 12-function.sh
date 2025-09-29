#!/bin/bash

user=$(id -u)

if [ $user -ne 0 ]; then
    echo "Please provide root previlage"
fi

VALIDATE(){
    if [ $? -ne 0 ]; then
    
}