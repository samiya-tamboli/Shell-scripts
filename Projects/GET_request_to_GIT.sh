#!/bin/bash

##############################
# Author: Samiya Tamboli
# This script is to make a GET request to GIT
# Arguments: Username and reponame
##############################

#set -x
set -o pipefail
set -e

if [ $# -ne 2 ]; then
        echo "Usage: $0 <username> <reponame>"
fi

url="https://api.github.com"
OWNER="$1"
REPO="$2"

# URL authenticating function
git_url () {
        local endpoint="$1"
        curl -s -u "${USERNAME}:${TOKEN}" "$url/$endpoint"
        }

pull_requests () {
        local endpoint="repos/${OWNER}/${REPO}/pulls"
        pulls="$(git_url "$endpoint")"
        echo "$pulls"
}

list_collaborators () {
        local endpoint="repos/${OWNER}/${REPO}/collaborators"
        collaborators="$(git_url "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"
}

# main body

list_collaborators
if [ -n $collaborators ]; then
        echo "The user with read access to repo is: $collaborators"
else
        echo "You have no users with read permissions"
fi
