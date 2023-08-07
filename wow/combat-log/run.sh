#!/bin/bash

# copy SavedVariables from WoW folder
sh copy.sh

# convert .lua to .csv
lua parser.lua

# copy files to docker
docker cp combat_log.csv postgres:/home/wow
docker cp schema.sql postgres:/home/wow

# create database
docker exec -it postgres bash -c "psql --username postgres --dbname wow --file /home/wow/schema.sql"

# open postgres console
docker exec -it postgres bash -c "psql --username postgres --dbname wow"
