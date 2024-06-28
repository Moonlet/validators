#!/bin/bash

echo "Start entrypoint"

HOME_DIR="/home/$USER/.$SERVICE"
echo "HOME_DIR: $HOME_DIR"

if [ ! -f "$HOME_DIR/config/genesis.json" ]; then
    echo "Set genesis: $GENESIS"
    wget -O genesis.json $GENESIS --inet4-only
    pwd
    mv genesis.json $HOME_DIR/config/genesis.json
fi

if [ ! -f "$HOME_DIR/config/addrbook.json" ]; then
    echo "Set addrbook: $ADDRBOOK"
    wget -O addrbook.json $ADDRBOOK --inet4-only
    pwd
    mv addrbook.json $HOME_DIR/config/addrbook.json
fi

# Check if the command arguments ($@) are provided
if [ -z "$1" ]; then
    set -- "start" \
        --address $ADDRESS \
        --moniker $MONIKER \
        --minimum-gas-prices $MIN_GAS_PRICE
fi

/$BINARY "$@"
