## Moonlet Validators

Setup mainnet and testnet blockchain nodes using Docker. \
This current version is suitable for Cosmos Tendermint Validators / RPC Nodes.

### Setup Commands

```sh
# Clone repo
git clone https://github.com/Moonlet/validators.git
cd validators

# Make executable
chmod +x $HOME/validators/scripts/*.sh

# Set the chain details
vi env

# Build the Docker image
./build.sh

# Run initialize
./initialize.sh

# Retrieve a snapshot to boost the sync
./snapshot.sh

# Start the Docker image
./start.sh
```

### Useful commands

```sh
# Export env vars to be accesible
export $(cat $HOME/validators/env | xargs)

# See status
docker exec ${SERVICE}_${NETWORK}_${SERVER_TYPE}_${VERSION} /$BINARY status | jq

# See version
docker exec ${SERVICE}_${NETWORK}_${SERVER_TYPE}_${VERSION} /$BINARY version

# See logs
docker logs -f --tail 0 ${SERVICE}_${NETWORK}_${SERVER_TYPE}_${VERSION}
```

TODO

- Add Pruning
- Add custom ports
