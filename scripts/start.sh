#!/bin/bash

source ./set-env.sh

docker-compose up -d

./logs.sh
