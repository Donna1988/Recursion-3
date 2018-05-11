#!/bin/bash


if (( $# != 1 )); then
    echo "Illegal number of parameters"
fi

if [ ! -f "$1" ]
then
    echo -e "$0: File '${1}' not found."
    exit
fi

if test -r "$1" -a -f "$1"
then
   echo "file is readable"
else
    exit
fi

sed 's/ /  /g' < $1 >outfile

cat outfile


