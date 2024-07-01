#!/bin/bash

./set-env.sh

docker-compose up -d

./logs.sh
