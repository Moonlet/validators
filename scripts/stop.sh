#!/bin/bash

source ./set-env.sh

echo "Docker stop container"

# add -t, --time # seconds
docker-compose stop ${SERVICE}_${NETWORK}_${SERVER_TYPE}_${VERSION}
