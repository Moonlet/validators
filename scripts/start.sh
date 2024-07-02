#!/bin/bash

source ./set-env.sh

echo "Docker start container"

docker-compose up -d

./logs.sh
