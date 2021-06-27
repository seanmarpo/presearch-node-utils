#!/bin/sh
set -e

if ! hash docker 2>/dev/null
then
    echo "Docker was not found, installing Docker..."
    curl https://get.docker.com/ | sudo sh
    exit
else
    echo "Docker appears available, attempting to start node."
    stty -echo
    printf "Presearch Node API Key: "
    read PREAPIKEY
    stty echo
    printf "\n"
    sudo docker stop presearch-node
    sudo docker rm presearch-node
    sudo docker stop presearch-auto-updater
    sudo docker rm presearch-auto-updater
    sudo docker run -d --name presearch-auto-updater --restart=unless-stopped -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower --cleanup --interval 300 presearch-node
    sudo docker pull presearch/node
    sudo docker run -dt --name presearch-node --restart=unless-stopped -v presearch-node-storage:/app/node -e REGISTRATION_CODE=$PREAPIKEY presearch/node
    sudo docker logs presearch-node
fi
