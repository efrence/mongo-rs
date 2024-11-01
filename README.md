# mongo replica set

**not for production**

## to start

#### without volume

`docker run -d -p 27017:27017 --name mongo-rs efrenux/mongo-rs`

##### or via compose

```yaml
version: "3.9"

services:
  mongo-rs:
    image: efrenux/mongo-rs
    container_name: mongo-rs
    restart: always
    ports:
      - "27017:27017"
```

wait for about 30 seconds for the replica set to initialiaze

## connection string

`mongodb://localhost:27017/db?replicaSet=replset`

do not modify the replica set name, `replset`, as it is crucial for a successful connection. modifying it will result in a connection failure
