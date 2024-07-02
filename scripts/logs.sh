#!/bin/bash

source ./set-env.sh

echo "Docker show container logs"

docker logs -f --tail 0 ${SERVICE}_${NETWORK}_${SERVER_TYPE}_${VERSION}
