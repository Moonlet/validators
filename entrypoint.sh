#!/bin/bash

# Check if the command arguments ($@) are provided
if [ -z "$1" ]; then
    set -- "start"
        # --minimum-gas-prices $MIN_GAS_PRICE
        # --moniker $MONIKER \
        # --p2p.laddr "tcp://0.0.0.0:$P2P_PORT"
fi

envsubst < /root/.${SERVICE}/config/app.toml > /root/.${SERVICE}/config/app.tmp
mv /root/.${SERVICE}/config/app.tmp /root/.${SERVICE}/config/app.toml

envsubst < /root/.${SERVICE}/config/client.toml > /root/.${SERVICE}/config/client.tmp
mv /root/.${SERVICE}/config/client.tmp /root/.${SERVICE}/config/client.toml

envsubst < /root/.${SERVICE}/config/config.toml > /root/.${SERVICE}/config/config.tmp
mv /root/.${SERVICE}/config/config.tmp /root/.${SERVICE}/config/config.toml

/$BINARY "$@"
