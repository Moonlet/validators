#!/bin/bash

source ./set-env.sh

docker exec ${SERVICE}_${NETWORK}_${SERVER_TYPE}_${VERSION} /$BINARY status | jq
