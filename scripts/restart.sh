#!/bin/bash

./set-env.sh

docker restart ${SERVICE}_${NETWORK}_${SERVER_TYPE}

./logs.sh
