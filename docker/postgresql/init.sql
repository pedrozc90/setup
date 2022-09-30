-- script used on docker-compose.yml initialization

-- create required role
CREATE ROLE pedrozc90 WITH SUPERUSER;

-- create new database
CREATE DATABASE "pedrozc90";

-- connect to pedrozc90 database
\c pedrozc90;

-- enabled pg_stat_statements (required by 'pghero')
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

-- enable pg_trgm module
CREATE EXTENSION IF NOT EXISTS pg_trgm;
