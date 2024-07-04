#!/bin/bash

source $HOME/validators/scripts/set-env.sh

source $HOME/validators/scripts/env-subst.sh

echo "Docker start container"

docker-compose up -d

./logs.sh
