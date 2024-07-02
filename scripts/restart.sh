#!/bin/bash

source ./set-env.sh

echo "Docker restart container"

./stop.sh && ./start.sh
