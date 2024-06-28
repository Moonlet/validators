## Moonlet Validators

Setup mainnet and testnet blockchain nodes using Docker.
This current version is suitable for Cosmos Tendermint Validators / RPC Nodes.

### Commands

1. Clone repo

```
git clone https://github.com/Moonlet/validators.git
cd validators
chmod +x build.sh run.sh
```

2. Update the `env` file

```
vi env
```

3. Build the Docker image

```
./build.sh
```

4. Run the Docker image

```
./run.sh
```

TODO

- Add Pruning
- Add custom ports
- Add initialize script
- Add snapshot script
