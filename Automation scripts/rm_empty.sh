#!/bin/bash

#######################
# Author: Samiya Tamboli
# Program to remove empty files and directories
# Argument: Path to directory required
#######################

# Usage
if [ $# -ne 1 ]; then
        echo "Usage: $0 </path/to/directory>"
        exit 1
fi

# Find empty directories and remove
find $1 -type d -empty -exec rmdir {} \;

# Find empty files and remove
find $1 -type f -empty -exec rm {} \;
