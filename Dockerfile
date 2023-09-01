FROM ubuntu

RUN apt-get update
RUN apt-get install wget -y
RUN apt-get install libcurl4 -y

RUN mkdir -p mongodb/bin

COPY ./entrypoint.sh /mongodb

RUN chmod +x /mongodb/entrypoint.sh

WORKDIR /mongodb/bin

RUN wget -O mongodb.tgz https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-ubuntu2204-7.0.0.tgz

RUN wget -O mongosh.tgz https://downloads.mongodb.com/compass/mongosh-1.10.6-linux-x64.tgz

RUN tar -xvf mongodb.tgz && mv mongodb-linux-x86_64-ubuntu2204-7.0.0 mongodb

RUN tar -xvf mongosh.tgz && mv mongosh-1.10.6-linux-x64 mongosh

WORKDIR /mongodb

RUN mkdir -p node1/data node1/log
RUN mkdir -p node2/data node2/log
RUN mkdir -p node3/data node3/log

CMD ["bash", "entrypoint.sh"]