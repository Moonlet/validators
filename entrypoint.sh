#!/bin/bash

# Check if initial setup is required
if [ ! -d "$HOME/.$SERVICE" ]; then
    echo "Initialize $MONIKER node"
    $BINARY init $MONIKER --chain-id $CHAIN_ID

    echo "Set chain-id $CHAIN_ID"
    $BINARY config chain-id $CHAIN_ID

    # TODO: setup app.toml and config.toml
fi

# Check if the command arguments ($@) are provided
if [ -z "$1" ]; then
    set -- "start"
fi

/$BINARY "$@"
