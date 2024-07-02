#!/bin/bash

source ./set-env.sh

docker restart $CONTAINER_NAME

./logs.sh
