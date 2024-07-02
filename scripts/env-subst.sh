#!/bin/bash

echo "Running envsubst"

source ./set-env.sh

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
