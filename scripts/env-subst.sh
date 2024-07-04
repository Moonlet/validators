#!/bin/bash

echo "Running envsubst"

source $HOME/validators/scripts/set-env.sh

export PRUNING="default"
export PRUNING_KEEP_RECENT="0"
export PRUNING_INTERVAL="0"

if [ "$SERVER_TYPE" = 'rpc' ] || [ "$SERVER_TYPE" = 'snapshot' ]; then
    export PRUNING="custom"
    export PRUNING_KEEP_RECENT="100"
    export PRUNING_INTERVAL="10"
fi

envsubst < "$HOME/validators/config/_app.toml" > $HOME/validators/config/_app_subst.toml
sudo mv $HOME/validators/config/_app_subst.toml $HOME/.${SERVICE}/config/app.toml

envsubst < "$HOME/validators/config/_client.toml" > $HOME/validators/config/_client_subst.toml
sudo mv $HOME/validators/config/_client_subst.toml $HOME/.${SERVICE}/config/client.toml

envsubst < "$HOME/validators/config/_config.toml" > $HOME/validators/config/_config_subst.toml
sudo mv $HOME/validators/config/_config_subst.toml $HOME/.${SERVICE}/config/config.toml

# API & RPC ports
DOCKER_COMPOSE_TEMPLATE="$HOME/validators/config/_docker-compose.yml"
DOCKER_COMPOSE_FILE="$HOME/validators/docker-compose.yml"
DOCKER_COMPOSE_CONTENT=$(cat "$DOCKER_COMPOSE_TEMPLATE")

if [ "$SERVER_TYPE" = 'rpc' ]; then
    CONDITIONAL_PORTS="      - ${API_PORT}:1317\n      - ${RPC_PORT}:26657"
    DOCKER_COMPOSE_CONTENT=$(echo "$DOCKER_COMPOSE_CONTENT" | sed "s|ports:|ports:\n$CONDITIONAL_PORTS|g")
fi
echo "$DOCKER_COMPOSE_CONTENT" > "$DOCKER_COMPOSE_FILE"
