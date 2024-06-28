#!/bin/bash

curl -L https://snapshots.kjnodes.com/$SERVICE/snapshot_latest.tar.lz4 | tar -Ilz4 -xf - -C $HOME/.$SERVICE
