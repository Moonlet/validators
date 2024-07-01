#!/bin/bash

./set-env.sh

docker logs -f --tail 0 ${SERVICE}_${NETWORK}_${SERVER_TYPE}
