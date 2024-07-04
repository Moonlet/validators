#!/bin/bash

SERVICE=$1
NETWORK=$2

echo "Copy $HOME/validators/envs/${SERVICE}.${NETWORK}.env to $HOME/validators/env"

cp $HOME/validators/envs/${SERVICE}.${NETWORK}.env $HOME/validators/env
