# Use the official Ubuntu image as the base
FROM ubuntu:20.04

# Set noninteractive mode for installation
ENV DEBIAN_FRONTEND=noninteractive

# Set environment variables for MongoDB version
ENV MONGO_VERSION=7.0

# Update packages and install necessary dependencies
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Add MongoDB GPG key
RUN wget -qO - https://www.mongodb.org/static/pgp/server-$MONGO_VERSION.asc | apt-key add -

# Add MongoDB repository
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/$MONGO_VERSION multiverse" | tee /etc/apt/sources.list.d/mongodb-org-$MONGO_VERSION.list

# Install MongoDB and the mongo shell
RUN apt-get update && apt-get install -y mongodb-org && rm -rf /var/lib/apt/lists/*

# Create the data directory
RUN mkdir -p /data/db && chown -R mongodb:mongodb /data/db

# Copy entrypoint script into the image
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
