#!/bin/bash

# references
# https://stackoverflow.com/questions/6245570/how-to-get-the-current-branch-name-in-git
# https://stackoverflow.com/questions/23296161/getting-a-list-of-branches-that-were-merged-into-another-branch

# get current branch name
current_branch=$(git branch --show-current)

if [[ -z $current_branch ]]; then
    echo "current branch name not found"
    ecit
elif [[ $current_branch = "master" ]]; then
    echo "unable to compare ${current_branch} and master"
    exit
else
    echo "listing ${current_branch} merged branches"
fi

# list branches not merged into current branch
git branch --list -a --merged $current_branch | sed 's/^..//;s/ .*//' | xargs git branch --list -a --no-merged master
