#!/bin/bash

VERSION=$1 # v0.37.0
SERVICE=elys
BINARY=elysd
GIT_URL=https://github.com/elys-network/elys/releases/download/$VERSION/elysd-$VERSION-linux-amd64

echo "Start upgrade to version $VERSION"

mkdir -p $HOME/.$SERVICE/cosmovisor/upgrades/$VERSION/bin
wget -O $HOME/.$SERVICE/cosmovisor/upgrades/$VERSION/bin/$BINARY $GIT_URL
chmod +x $HOME/.$SERVICE/cosmovisor/upgrades/$VERSION/bin/$BINARY

echo "$BINARY $VERSION moved to cosmovisor upgrades"
