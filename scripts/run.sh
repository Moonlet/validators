#!/bin/bash

export $(cat $HOME/validators/env | xargs)

docker-compose up -d

docker logs ${SERVICE}_${NETWORK}_${SERVER_TYPE} -f
