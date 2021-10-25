#!/bin/bash

# Copy the keys directory out of the docker container and place it on the local filesystem
sudo docker cp presearch-node:/app/node/.keys presearch-node-keys
echo "Your Presearch Node keys were backed up to: $(pwd)/presearch-node-keys"
echo "[WARNING] Keep this directory safe. It can be used to recreate your node."