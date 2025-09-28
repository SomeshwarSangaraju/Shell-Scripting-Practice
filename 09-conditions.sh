#!/bin/bash

number=$1

if [$1 - le 0] ; then
    echo "$1 is less than zero"
else
    echo "$1 is greater than or equal to zero"
fi

