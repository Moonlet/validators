#!/bin/bash

echo "Initialize..."

export $(cat env | xargs)

echo "Set genesis: $GENESIS"
wget -O genesis.json $GENESIS --inet4-only
sudo mv genesis.json $HOME/.$SERVICE/config/genesis.json

echo "Set addrbook: $ADDRBOOK"
wget -O addrbook.json $ADDRBOOK --inet4-only
sudo mv addrbook.json $HOME/.$SERVICE/config/addrbook.json

echo "Finish initialize."
