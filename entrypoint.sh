#!/bin/bash
set -e

mkdir -p /mongodb/node1/data
mkdir -p /mongodb/node1/log
chown -R mongodb:mongodb /mongodb

/usr/bin/mongod --dbpath /mongodb/node1/data --logpath /mongodb/node1/log/mongod.log --port 27017 --bind_ip_all --replSet replset --fork

sleep 5

/usr/bin/mongosh --port 27017 --eval "rs.initiate({ _id: 'replset', version: 1, members: [{_id: 0, host: 'localhost:27017'}] });"

# Keep the container running
tail -f /dev/null
