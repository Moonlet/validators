#!/bin/bash

./set-env.sh

docker logs ${SERVICE}_${NETWORK}_${SERVER_TYPE} -f
