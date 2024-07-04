#!/bin/bash

source $HOME/validators/scripts/set-env.sh

echo "Docker stop container"

# add -t, --time # seconds
docker stop ${SERVICE}_${NETWORK}_${SERVER_TYPE}_${VERSION}
