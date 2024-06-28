#!/bin/bash

# Check if initial setup is required
if [ ! -d "$HOME/.$SERVICE" ]; then
    echo "Set chain-id $CHAIN_ID"
    $BINARY config chain-id $CHAIN_ID

    echo "Initialize $MONIKER node"
    $BINARY init $MONIKER

    # service init
    # TODO: setup app.toml and config.toml
fi

# Check if the command arguments ($@) are provided
if [ -z "$1" ]; then
    set -- "start"
fi

/$BINARY "$@"
