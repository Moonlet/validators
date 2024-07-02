#!/bin/bash

# Check if the command arguments ($@) are provided
if [ -z "$1" ]; then
    set -- "start" \
        --minimum-gas-prices $MIN_GAS_PRICE
        # --moniker $MONIKER \
        # --p2p.laddr "tcp://0.0.0.0:$P2P_PORT"
fi

envsubst < /root/app.toml > /root/.${SERVICE}/config/app.toml
envsubst < /root/client.toml > /root/.${SERVICE}/config/client.toml
envsubst < /root/config.toml > /root/.${SERVICE}/config/config.toml

/$BINARY "$@"
