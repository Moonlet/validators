#!/bin/bash

source $HOME/validators/scripts/set-env.sh

echo "Docker build image"

# Build the Docker image with all environment variables as build arguments
docker build \
  --build-arg GIT_REPO=${GIT_REPO} \
  --build-arg BINARY=${BINARY} \
  -t "${SERVICE}_${NETWORK}_${VERSION}" \
  -f $HOME/validators/Dockerfile $HOME/validators

echo "Docker remove unused images"

# Remove the ubuntu image
docker rmi ubuntu:22.04

# Remove the dangling image with <none> tag
docker images -q -f dangling=true | xargs docker rmi -f

echo "Docker image"
docker images | grep ${SERVICE}_${NETWORK}
