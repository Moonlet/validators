#!/bin/bash

source ./set-env.sh

echo "Docker stop container"
docker stop $CONTAINER_NAME

echo "Delete data folder"
sudo rm -rf "$HOME/.$SERVICE/data"

echo "Download snapshot"
aria2c -x16 -s16 https://snapshots.kjnodes.com/$SERVICE/snapshot_latest.tar.lz4
lz4 -c -d snapshot_latest.tar.lz4 | tar -x -C $HOME/.$SERVICE
rm -rf snapshot_latest.tar.lz4

# echo "Docker start container"
# docker start $CONTAINER_NAME

# echo "Docker logs"
# docker logs $CONTAINER_NAME
