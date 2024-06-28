#!/bin/bash

# Check if initial setup is required
if [ ! -d "$HOME/.$SERVICE" ]; then
    echo "Initialize $MONIKER node"
    $BINARY init $MONIKER --chain-id $CHAIN_ID

    echo "Set chain-id $CHAIN_ID"
    $BINARY config chain-id $CHAIN_ID

    echo "Set genesis: $GENESIS"
    curl -Ls $GENESIS > $HOME/.$SERVICE/config/genesis.json

    echo "Set addrbook: $ADDRBOOK"
    curl -Ls $ADDRBOOK > $HOME/.$SERVICE/config/addrbook.json

    echo "Set minimum gas price"
    sed -i -e "s|^minimum-gas-prices *=.*|minimum-gas-prices = \"$MIN_GAS_PRICE\"|" $HOME/.$SERVICE/config/app.toml

    # TODO: setup app.toml and config.toml
fi

# Check if the command arguments ($@) are provided
if [ -z "$1" ]; then
    set -- "start"
fi

/$BINARY "$@"
