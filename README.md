## Moonlet Validators

Setup mainnet and testnet blockchain nodes using Docker.
This current version is suitable for Cosmos Tendermint Validators / RPC Nodes.

### Commands

1. Clone repo

```sh
git clone https://github.com/Moonlet/validators.git
cd validators
chmod +x build.sh run.sh initialize.sh snapshot.sh
```

2. Update the `env` file

```sh
vi env
```

3. Build the Docker image

```sh
./build.sh
```

4. Run initialize

```sh
./initialize.sh
```

4. Run the Docker image

```sh
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
