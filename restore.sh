#!/bin/bash


# Acquire the directory where the node keys are
get_keys_dir() {
    read -p "Path to keys directory: [default: $(pwd)/presearch-node-keys/] " KEYSDIR < /dev/tty
    if test -z "$KEYSDIR"
    then
        KEYSDIR="$(pwd)/presearch-node-keys"
    fi
    
    echo ""
    echo "Searching for keys in: $KEYSDIR"
}

# Basic validation routines to confirm the directory provided "should" work
search_for_keys() {
    if [[ ! -d "$KEYSDIR" ]]
    then
        echo "[ERROR] $KEYSDIR does not exist"
        exit 1
    fi

    if [[ ! -f "$KEYSDIR/id_rsa" && ! -s "$KEYSDIR/id_rsa" ]] 
    then
        echo "[ERROR] $KEYSDIR/id_rsa does not exist, cannot perform restore"
        exit 1
    fi

    if [[ ! -f "$KEYDIR/id_rsa.pub" && ! -s "$KEYSDIR/id_rsa.pub" ]]
    then
        echo "[ERROR] $KEYSDIR/id_rsa.pub does not exist, cannot perform restore"
        exit 1
    fi

    echo "Validated files are present, starting restore."
}

get_keys_dir
search_for_keys

# Automagical incantation provided by Presearch Nodes Telegram group
sudo docker run -dt --rm -v presearch-node-storage:/app/node --name presearch-restore presearch/node ; sudo docker cp $KEYSDIR/. presearch-restore:/app/node/.keys/ ; sudo docker stop presearch-restore

echo "Restored Presearch Node keys, you can now safely start up your node"
echo "HINT: You can run the setup.sh script to launch your node now"