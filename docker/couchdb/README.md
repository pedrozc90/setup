# [CouchDB](http://couchdb.apache.org/)

## Docker Container

```bash
# initialize couchdb docker container
docker run --detach --restart=always --name=couchdb -p 5984:5984 --env COUCHDB_USER=admin --env COUCHDB_PASSWORD=pwd couchdb

# configure container to auto start
docker update --restart=always couchdb
```

# Reference
+ [**CouchDB**](http://couchdb.apache.org/)
+ [Documentation](http://docs.couchdb.org/en/stable/)
+ [**console**](http://localhost:5984/_utils/)
+ [couchdb_docker](https://github.com/apache/couchdb-docker)
