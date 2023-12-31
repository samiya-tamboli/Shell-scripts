#!/usr/bin/env bash

#########################
# Author: Samiya Tamboli
# Purpose: This script prints the file/dir sizes in a particular path
# Argument: Provide a path eg: path/
#########################

#For current directory
#for i in $(ls -S1); do
#   echo $i: $(du -sh "$i" | cut -f1)
#done 

#For a particular path

if [ -z "$1" ]; then                                         #z flag checks if argument is empty
            echo "Usage: $0 <directory_path>"                #if empty then it will show user the usage of script
                exit 1					     #it will then exit as error
fi

directory_path="$1" 					     #passes the first argument into a variable

for item in "$directory_path"/*; do                          #this for loop goes to each item in directory path, /* lists all item in that dir
            if [ -e "$item" ]; then                          #e flag checks if item exists
                    item_name=$(basename "$item")	     #it exists that extract items name, this is done by basename command
                    item_size=$(du -sh "$item" | cut -f1)    #extract its size (s) using du command in human readable format (h), cut first column only from du commmand output
                    echo "$item_name: $item_size"            #print name : size
            fi
done