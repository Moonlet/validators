#!/bin/bash

source ./set-env.sh

echo "Docker stop container"
docker stop ${SERVICE}_${NETWORK}_${SERVER_TYPE}_${VERSION}

echo "Delete data folder"
sudo rm -rf "$HOME/.$SERVICE/data"

echo "Download snapshot"
aria2c -x16 -s16 https://snapshots.kjnodes.com/$SERVICE/snapshot_latest.tar.lz4
lz4 -c -d snapshot_latest.tar.lz4 | tar -x -C $HOME/.$SERVICE
rm -rf snapshot_latest.tar.lz4

# echo "Docker start container"
# docker start ${SERVICE}_${NETWORK}_${SERVER_TYPE}_${VERSION}

# echo "Docker logs"
# docker logs ${SERVICE}_${NETWORK}_${SERVER_TYPE}_${VERSION}
