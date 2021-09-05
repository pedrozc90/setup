-- script used on docker-compose.yml initialization

-- create required role
CREATE ROLE pedrozc90 WITH SUPERUSER;

-- create extension for pghero
CREATE EXTENSION pg_stat_statements;

-- create a empty database
CREATE DATABASE "pedrozc90";
