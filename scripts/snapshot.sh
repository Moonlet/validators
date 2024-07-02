#!/bin/bash

source ./set-env.sh

echo "Docker retrieve from snapshot"

./stop.sh

echo "Delete data folder"
sudo rm -rf "$HOME/.$SERVICE/data"

echo "Download snapshot"
aria2c -x16 -s16 https://snapshots.kjnodes.com/$SERVICE/snapshot_latest.tar.lz4
lz4 -c -d snapshot_latest.tar.lz4 | tar -x -C $HOME/.$SERVICE
rm -rf snapshot_latest.tar.lz4

./start.sh
