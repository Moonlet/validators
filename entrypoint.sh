#!/bin/bash

# Check if the command arguments ($@) are provided
if [ -z "$1" ]; then
    set -- "start" \
        --address $ADDRESS \
        --moniker $MONIKER \
        --minimum-gas-prices $MIN_GAS_PRICE
fi

/$BINARY "$@"
