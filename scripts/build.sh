#!/bin/bash

# Source the env file
# TODO: check and replace with export $(cat $HOME/validators/env | xargs)
set -o allexport
source .$HOME/env
set +o allexport

# Build the Docker image with all environment variables as build arguments
docker build \
  --build-arg GIT_REPO=${GIT_REPO} \
  --build-arg BINARY=${BINARY} \
  -t "${SERVICE}_${NETWORK}" .

# Remove the ubuntu image
docker rmi ubuntu:22.04

# Remove the dangling image with <none> tag
docker images -q -f dangling=true | xargs docker rmi -f

echo "Docker image"
docker images | grep ${SERVICE}_${NETWORK}
