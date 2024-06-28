#!/bin/bash

export $(cat env | xargs)

docker stop ${SERVICE}_${NETWORK}_${SERVER_TYPE}

aria2c -x16 -s16 https://snapshots.kjnodes.com/$SERVICE/snapshot_latest.tar.lz4 -o - | tar -I lz4 -xf - -C "$HOME/.$SERVICE"

docker start ${SERVICE}_${NETWORK}_${SERVER_TYPE}

docker logs ${SERVICE}_${NETWORK}_${SERVER_TYPE}
