#!/bin/bash

echo "Initialize..."

export $(cat $HOME/validators/env | xargs)

HOME_DIR=$HOME/.$SERVICE/config

if [ ! -d "$HOME_DIR" ]; then
    mkdir -p $HOME_DIR
fi

echo "Set genesis: $GENESIS"
wget -O genesis.json $GENESIS --inet4-only
sudo mv genesis.json $HOME_DIR/genesis.json

echo "Set addrbook: $ADDRBOOK"
wget -O addrbook.json $ADDRBOOK --inet4-only
sudo mv addrbook.json $HOME_DIR/addrbook.json

echo "Finish initialize."
