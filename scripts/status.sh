#!/bin/bash

source ./set-env.sh

docker exec ${SERVICE}_${NETWORK}_${SERVER_TYPE} /$BINARY status | jq
