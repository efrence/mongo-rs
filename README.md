# mongo replica set

**not for production**

## to start

#### without volume

`docker run -d -p 27017:27017 -p 27018:27018 -p 27019:27019 --name mongo-rs kamalyb/mongo-rs`

##### or via compose

```yaml
version: "3.9"

services:
  mongo-rs:
    image: kamalyb/mongo-rs
    container_name: mongo-rs
    restart: always
    ports:
      - "27017:27017"
      - "27018:27018"
      - "27019:27019"
```

#### with volume

`docker run -d -p 27017:27017 -p 27018:27018 -p 27019:27019 -v node1:/mongodb/node1/data -v node2:/mongodb/node2/data -v node3:/mongodb/node3/data kamalyb/mongo-rs`

##### or via compose

```yaml
version: "3.9"

services:
  mongo-rs:
    image: kamalyb/mongo-rs
    container_name: mongo-rs
    restart: always
    ports:
      - "27017:27017"
      - "27018:27018"
      - "27019:27019"
    volumes:
      - node1:/mongodb/node1/data
      - node2:/mongodb/node2/data
      - node3:/mongodb/node3/data

volumes:
  node1:
  node2:
  node3:
```

wait for about 30 seconds for the replica set to initialiaze

## connection string

`mongodb://localhost:27017,localhost:27018,localhost:27019/db?replicaSet=replset`

do not modify the replica set name, `replset`, as it is crucial for a successful connection. modifying it will result in a connection failure
