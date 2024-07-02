#!/bin/bash

# Check if the command arguments ($@) are provided
if [ -z "$1" ]; then
    set -- "start" \
        --moniker $MONIKER \
        --minimum-gas-prices $MIN_GAS_PRICE \
        --p2p.laddr "tcp://0.0.0.0:$P2P_PORT"
fi

# Ensure P2P_PORT is set
if [ -z "$P2P_PORT" ]; then
  echo "P2P_PORT environment variable is not set. Exiting."
  exit 1
fi

# Replace the P2P port in the config.toml file
envsubst < /home/.${SERVICE}/config/config.toml > /home/.${SERVICE}/config/config.tmp
mv /home/.${SERVICE}/config/config.tmp /home/.${SERVICE}/config/config.toml

/$BINARY "$@"
