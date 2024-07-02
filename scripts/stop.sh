#!/bin/bash

source ./set-env.sh

# add -t, --time # seconds
docker stop ${SERVICE}_${NETWORK}_${SERVER_TYPE}
