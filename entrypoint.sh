#!/bin/bash

echo "Start entrypoint"

# Check if initial setup is required
# if [ ! -d "$HOME/.$SERVICE" ]; then
#     echo "Initialize $MONIKER node"
#     $BINARY init $MONIKER --chain-id $CHAIN_ID

#     echo "Set chain-id $CHAIN_ID"
#     $BINARY config chain-id $CHAIN_ID

#     echo "Set minimum gas price"
#     sed -i -e "s|^minimum-gas-prices *=.*|minimum-gas-prices = \"$MIN_GAS_PRICE\"|" $HOME/.$SERVICE/config/app.toml

#     # TODO: setup app.toml and config.toml
# else
#     echo "Initial setup has been already made"
# fi

if [ ! -f "$HOME/.$SERVICE/config/genesis.json" ]; then
    echo "Set genesis: $GENESIS"
    curl -Ls $GENESIS > $HOME/.$SERVICE/config/genesis.json
fi

if [ ! -f "$HOME/.$SERVICE/config/addrbook.json" ]; then
    echo "Set addrbook: $ADDRBOOK"
    curl -Ls $ADDRBOOK > $HOME/.$SERVICE/config/addrbook.json
fi

# Check if the command arguments ($@) are provided
if [ -z "$1" ]; then
    set -- "start" \
        --address $ADDRESS \
        --moniker $MONIKER \
        --minimum-gas-prices $MIN_GAS_PRICE
fi

/$BINARY "$@"
