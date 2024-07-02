#!/bin/bash

source ./set-env.sh

echo "Docker restart container"

docker restart ${SERVICE}_${NETWORK}_${SERVER_TYPE}_${VERSION}

./logs.sh
