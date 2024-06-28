#!/bin/bash

echo "Start entrypoint"

if [ ! -f "$HOME/.$SERVICE/config/genesis.json" ]; then
    echo "Set genesis: $GENESIS"
    wget -O genesis.json $GENESIS --inet4-only
    mv genesis.json $HOME/.$SERVICE/config/genesis.json
fi

if [ ! -f "$HOME/.$SERVICE/config/addrbook.json" ]; then
    echo "Set addrbook: $ADDRBOOK"
    wget -O addrbook.json $ADDRBOOK --inet4-only
    mv addrbook.json $HOME/.$SERVICE/config/addrbook.json
fi

# Check if the command arguments ($@) are provided
if [ -z "$1" ]; then
    set -- "start" \
        --address $ADDRESS \
        --moniker $MONIKER \
        --minimum-gas-prices $MIN_GAS_PRICE
fi

/$BINARY "$@"
