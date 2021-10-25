# Presearch Node Utilities

## About
Presearch is a decentralized search engine. This script helps automatically provision a new presearch node.
More details about running a node at: [https://nodes.presearch.org/run](https://nodes.presearch.org/run)

This repo is designed to provide you with a setup of quick utilities that you can run without needing to clone anything
or install git. Everything should be able to be `curl | bash`, if you so desire.

---

## Utils

### Setup a New Node
Quick node provisioner script to get the presearch node up-and-running.

Downloads and installs Docker CE. You will be prompted for your Presearch API Key, then your node will be launched.

_Tested against Ubuntu 20.04.3 LTS and 21.04._

**Usage**:
* `curl https://raw.githubusercontent.com/seanmarpo/presearch-node-utils/main/setup.sh | bash`


### Backup Node Keys
Backup your presearch node RSA keys. Primarily useful if you were grandfathered in to the 1000 PRE stake requirement. This will allow you to destroy your node and recreate it with the lower stake requirement.

**Usage**:
* `curl https://raw.githubusercontent.com/seanmarpo/presearch-node-utils/main/backup.sh | bash`


### Restore Node Keys
Restore your backed up node keys. Does basic testing to ensure the directory provided is correct and the required files are not empty.

You can run the `setup.sh` script after this script completes to re-launch your node with the restored keys.

**Usage**:
* `curl https://raw.githubusercontent.com/seanmarpo/presearch-node-utils/main/restore.sh | bash`

## Why?
This is a no-clone, hyper-minimal way to perform common functions for a Presearch Node.

## Wanna contribute?
Feel free to open an issue or file a PR. I'd be happy to review your changes and merge them.
