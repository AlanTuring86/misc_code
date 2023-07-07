#!/bin/bash

# Check if the python script is provided as an argument
if [ $# -eq 0 ]
then
    echo "No python script provided"
    exit 1
fi

# Check if the file exists and is a valid python script 
if [ ! -f $1 ] || [ ${1##*.} != "py" ] 
then 
    echo "Invalid python script" 
    exit 1 
fi 

 # Remove any spaces at the beginning of each line of the input file EXCEPT inside instruction blocks such as fors or ifs. 

 sed -i 's/^[ \t]*//' $1

 # Use autopep8 to check and correct indentation of the python script 
autopep8 --in-place --aggressive --indent-size 4 $1