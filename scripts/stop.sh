#!/bin/bash

source ./set-env.sh

echo "Docker stop container"

# add -t, --time # seconds
docker down ${SERVICE}_${NETWORK}_${SERVER_TYPE}_${VERSION}
