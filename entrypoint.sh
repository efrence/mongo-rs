#!/bin/bash

/mongodb/bin/mongodb/bin/mongod --dbpath /mongodb/node1/data --logpath /mongodb/node1/log/mongod.log --port 27017 --bind_ip_all --replSet replset --fork

/mongodb/bin/mongodb/bin/mongod --dbpath /mongodb/node2/data --logpath /mongodb/node2/log/mongod.log --port 27018 --bind_ip_all --replSet replset --fork

/mongodb/bin/mongodb/bin/mongod --dbpath /mongodb/node3/data --logpath /mongodb/node3/log/mongod.log --port 27019 --bind_ip_all --replSet replset --fork

/mongodb/bin/mongosh/bin/mongosh --port 27017 --eval "rs.initiate({ _id: 'replset', version: 1, members: [{_id: 0, host: 'localhost:27017'}, {_id: 1, host: 'localhost:27018'}, {_id: 2, host: 'localhost:27019'}] });"

tail -f /dev/null