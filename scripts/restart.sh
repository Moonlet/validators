#!/bin/bash

source ./set-env.sh

docker restart ${SERVICE}_${NETWORK}_${SERVER_TYPE}_${VERSION}

./logs.sh
