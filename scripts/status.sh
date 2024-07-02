#!/bin/bash

source ./set-env.sh

docker exec $CONTAINER_NAME /$BINARY status | jq
