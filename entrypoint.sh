#!/bin/bash

# Check if initial setup is required
# if [ ! -d "$HOME/.$SERVICE" ] || [ ! -f "/usr/local/bin/$BINARY" ]; then
#     # service init
#     # app si config toml
#   /usr/local/bin/initialize.sh
# fi

# TODO: "$@" poate sa fie gol si atunci il pun pe start

/dymd "$@"
