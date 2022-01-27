#!/bin/bash

dbname="master"
filename=$1

if [[ -z $filename ]]; then
    filename=$(find . -type f -regex ".*\.tar" -maxdepth 1 | sort -r | head -n 1)
fi

if [[ -z $filename ]]; then
    exit
fi

echo "restoring file ${filename}"

sh restore.sh "${dbname}" "${filename}"
