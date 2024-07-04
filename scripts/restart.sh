#!/bin/bash

source $HOME/validators/scripts/set-env.sh

echo "Docker restart container"

./stop.sh && ./start.sh
