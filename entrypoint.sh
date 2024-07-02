#!/bin/bash

# Check if the command arguments ($@) are provided
if [ -z "$1" ]; then
    set -- "start"
        # --minimum-gas-prices $MIN_GAS_PRICE
        # --moniker $MONIKER \
        # --p2p.laddr "tcp://0.0.0.0:$P2P_PORT"
fi

# Ensure P2P_PORT is set
if [ -z "$P2P_PORT" ]; then
  echo "P2P_PORT environment variable is not set. Exiting."
  exit 1
fi

envsubst < /home/.${SERVICE}/config/app.toml > /home/.${SERVICE}/config/app.tmp
mv /home/.${SERVICE}/config/app.tmp /home/.${SERVICE}/config/app.toml

envsubst < /home/.${SERVICE}/config/client.toml > /home/.${SERVICE}/config/client.tmp
mv /home/.${SERVICE}/config/client.tmp /home/.${SERVICE}/config/client.toml

envsubst < /home/.${SERVICE}/config/config.toml > /home/.${SERVICE}/config/config.tmp
mv /home/.${SERVICE}/config/config.tmp /home/.${SERVICE}/config/config.toml

/$BINARY "$@"
