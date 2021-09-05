# [MongoDB](https://www.mongodb.com/)

## Commands

```bash
# open mongo shell from docker container
docker exec -it mongodb mongo --host 127.0.0.1 --port 27017 --username admin --password pwd --authenticationDatabase admin master
```

## Mongo Console

```bash
# list databases
show dbs;

# select 'admin' database
use admin

# list database collections
show collections
```
