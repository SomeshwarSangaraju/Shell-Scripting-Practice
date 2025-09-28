#!/bin/bash

echo "All variables passed to the script : $@"
echo "All variables passed to the script : $*"
echo "script name : $0"
echo "sricpt home directory : $HOME"
echo "User : $USER"
echo "process ID of the script : $$"
echo "Current working directory : $PWD"
sleep 10 &
echo "PID of last command in the background : $!"