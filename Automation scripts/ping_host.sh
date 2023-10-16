#!/bin/bash
######################
# Author: Samiya 
# Program to check if a host is alive or dead
######################

# Checking if argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <host>"
    exit 1
fi

# Host ip into variable host
host="$1"

# Pinging the host
if ping -c 1 "$host" &> /dev/null; then                       
    response_time=$(ping -c 1 "$host" | awk -F'/' '/^rtt/ { print $5 }')
    
    if [ -n "$response_time" ]; then
        echo "Host is alive. Response time: $response_time ms"
    else
        echo "Host is alive, but response time not available."
    fi
else
    echo "Host is down"
fi
