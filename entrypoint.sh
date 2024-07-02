#!/bin/bash

# Check if the command arguments ($@) are provided
if [ -z "$1" ]; then
    set -- "start" \
        --moniker $MONIKER \
        --minimum-gas-prices $MIN_GAS_PRICE \
        --p2p.laddr "tcp://0.0.0.0:$P2P_PORT"
fi

/$BINARY "$@"
