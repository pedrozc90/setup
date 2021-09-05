# Postgresql Scripts

## Open Console

```bash
# open postgres console
psql --host "127.0.0.1" \
    --port "5432" \
    --username "postgres" \
    --dbname "pedrozc90"
```

## Backup

```bash
# dump the whole database
pg_dump --file "/home/database-$(date +%Y-%m-%d-%H-%M-%S).tar" \
        --host "127.0.0.1" \
        --port "5432" \
        --username "postgres" \
        --verbose \
        --format=t \
        --section=pre-data \
        --section=data \
        --dbname "database"
```

```bash
# dump only specified tables
pg_dump --file "/home/database-$(date +%Y-%m-%d-%H-%M-%S).tar" \
        --host "127.0.0.1" \
        --port "5432" \
        --username "postgres" \
        --verbose \
        --format=t \
        --section=pre-data \
        --section=data \
        --table "public.table_1" \
        --table "public.table_2" \
        --table "public.table_3" \
        --table "public.table_4" \
        --table "public.table_5" \
        --table "public.table_6" \
        --dbname "database"
```

## Restore

```bash
# restore dump file .tar into a specified database
pg_restore --host "127.0.0.1" \
        --port 5432 \
        --username "postgres" \
        --dbname "database" \
        --verbose  \
        "/home/backups/database-$(date +%Y-%m-%d-%H-%M-%S).tar"
```

## Run Command

```bash
# run script in a database
psql --username "postgres" \
    --dbname "database" \
    --echo-errors \
    --echo-queries \
    --file "script.sql"
```

## Utilities

```bash
dbname=my_database

# drop database if already exists
psql --username "postgres" --command "drop database if exists \"${dbname}\";"

# create a new database
psql --username "postgres" --command "create database \"${dbname}\";"

# create required roles
psql --username "postgres" --command "create role truevueadmin superuser;"
```
