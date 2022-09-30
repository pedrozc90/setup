#!/bin/bash

dbname=$1
filename=$2
role="pedrozc90"

if [[ -z $dbname ]]; then
	echo "database name not defined!"
    exit
fi

if [[ -z $filename ]]; then
    echo "no dump file $filename found."
    exit
fi

# drop database if already exists
psql --username "postgres" --command "DROP DATABASE IF EXISTS \"${dbname}\";"

# create a new database
psql --username "postgres" --command "CREATE DATABASE \"${dbname}\";"

# create required roles
psql --username "postgres" --command "CREATE ROLE $role superuser;"

# enabled pg_stat_statements (required by 'pghero')
psql --username "postgres" --command "CREATE EXTENSION IF NOT EXISTS pg_stat_statements;"

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
