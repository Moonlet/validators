## Moonlet Validators

Setup mainnet and testnet blockchain nodes using Docker.
This current version is suitable for Cosmos Tendermint Validators / RPC Nodes.

### Setup Commands

```sh
# Clone repo
git clone https://github.com/Moonlet/validators.git
cd validators

# Make executable
chmod +x build.sh initialize.sh snapshot.sh run.sh

# Update the `env` file
vi env

# Build the Docker image
./build.sh

# Run initialize
./initialize.sh

# Retrieve a snapshot to boost the sync
./snapshot.sh

# Run the Docker image
./run.sh
```

### Usefull commands

```sh
# Export env vars to be accesible
export $(cat env | xargs)

# See status
docker exec ${SERVICE}_${NETWORK}_${SERVER_TYPE} /$BINARY status | jq

# See logs
docker logs ${SERVICE}_${NETWORK}_${SERVER_TYPE} -f
```

TODO

- Add Pruning
- Add custom ports
