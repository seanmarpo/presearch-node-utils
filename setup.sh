#!/bin/bash
set -e

# Magical incantation provided by Presearch
# Only customization is the capturing of the Presearch API Key
setup_node() {
    read -s -p "Presearch Node API Key: " PREAPIKEY < /dev/tty
    docker stop presearch-node ; docker rm presearch-node ; docker stop presearch-auto-updater ; docker rm presearch-auto-updater ; docker run -d --name presearch-auto-updater --restart=unless-stopped -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower --cleanup --interval 300 presearch-node ; docker pull presearch/node ; docker run -dt --name presearch-node --restart=unless-stopped -v presearch-node-storage:/app/node -e REGISTRATION_CODE=$PREAPIKEY presearch/node ; docker logs presearch-node
}

# If we do not have docker, run the docker installer script
# NOTE: curl to bash is a horrible idea 99.9999% of the time - Do this with caution.
if ! hash docker 2>/dev/null
then
    echo "Docker was not found, installing Docker..."
    curl https://get.docker.com/ | sudo sh
    setup_node
else
    echo "Docker appears available, attempting to start node."
    setup_node
fi
