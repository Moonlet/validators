#!/bin/bash

export $(cat $HOME/validators/env | xargs)

docker exec ${SERVICE}_${NETWORK}_${SERVER_TYPE} /$BINARY status | jq
