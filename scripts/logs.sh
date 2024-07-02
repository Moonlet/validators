#!/bin/bash

source ./set-env.sh

docker logs -f --tail 0 $CONTAINER_NAME
