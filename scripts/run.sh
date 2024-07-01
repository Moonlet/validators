#!/bin/bash

./set-env.sh

docker-compose up -d

docker logs ${SERVICE}_${NETWORK}_${SERVER_TYPE} -f
