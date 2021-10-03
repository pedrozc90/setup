#!/bin/bash

username="root"
password="d3qMgE0W4eBb"
database="test"

docker exec -it mongodb bash -c "mongo --host 127.0.0.1 --port 27017 --username ${username} --password ${password} --authenticationDatabase admin"
