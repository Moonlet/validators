#!/bin/bash

# Check if the command arguments ($@) are provided
if [ -z "$1" ]; then
    set -- "start"
fi

envsubst < /root/app.toml > /root/.${SERVICE}/config/app.toml
envsubst < /root/client.toml > /root/.${SERVICE}/config/client.toml
envsubst < /root/config.toml > /root/.${SERVICE}/config/config.toml

/$BINARY "$@"
