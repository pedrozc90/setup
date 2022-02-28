#!/bin/bash

dbname=$1
filename=$2
role="pedrozc90"

if [[ -z $dbname ]]; then
	echo "Database name not defined!"
    exit
fi

if [[ -z $filename ]]; then
    echo "No dump file $filename found."
    exit
fi

# drop database if already exists
psql --username "postgres" --command "drop database if exists \"${dbname}\";"

# create a new database
psql --username "postgres" --command "create database \"${dbname}\";"

# create required roles
psql --username "postgres" --command "create role $role superuser;"

start_time=$(date +%s)

# populate new database
pg_restore --username "postgres" --dbname ${dbname} --verbose "${filename}"

end_time=$(date +%s)

# vacuum database
psql --username "postgres" --dbname ${dbname} --command "VACUUM FULL ANALYZE;"

# elapsed time with millisecond resolution
# keep three digits after floating point.
elapsed=$(( end_time - start_time))

echo "ELAPSED TIME: ${elapsed} seconds"
