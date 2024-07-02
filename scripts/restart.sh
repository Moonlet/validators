#!/bin/bash

source ./set-env.sh

echo "Docker restart container"

docker-compose restart ${SERVICE}_${NETWORK}_${SERVER_TYPE}_${VERSION}

./logs.sh
