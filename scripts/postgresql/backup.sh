#!/bin/bash

dbname=$1
if [[ -z $dbname ]]; then
	dbname="master"
fi

filename="./backup-${dbname}-$(date +%Y-%m-%d-%H-%M-%S).tar.gz"

pg_dump --host "127.0.0.1" \
    --port "5432" \
    --username "postgres" \
    --verbose \
    --format=t \
    --dbname "${dbname}" | gzip -v9 > $filename
