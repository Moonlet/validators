#!/bin/bash

source $HOME/validators/scripts/set-env.sh

echo "Docker container status"

docker exec ${SERVICE}_${NETWORK}_${SERVER_TYPE}_${VERSION} /$BINARY status | jq
