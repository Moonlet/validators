#!/bin/bash

export $(cat $HOME/validators/env | xargs)

# add -t, --time # seconds
docker stop ${SERVICE}_${NETWORK}_${SERVER_TYPE}
