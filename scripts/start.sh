#!/bin/bash

source ./set-env.sh

./env-subst.sh

echo "Docker start container"

docker-compose up -d

./logs.sh
