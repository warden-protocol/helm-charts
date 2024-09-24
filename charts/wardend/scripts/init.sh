#!/usr/bin/env bash
set -x
#Check if Home data exists, if not create it.
if [ ! -d "$WARDEND_HOME/data" ] && [ ! -d "$WARDEND_HOME/config" ]; then
    #Install utils
    if [[ "$SYNC_METHOD" == "scratch" ]]; then
        /usr/bin/wardend init --chain-id "$WARDEND_CHAIN_ID" "$WARDEND_MONIKER"
    elif [[ "$SYNC_METHOD" == "snapshot" ]]; then
        mkdir $WARDEND_HOME
        curl -L $SNAPSHOT_URL | tar -xzvf - -C $WARDEND_HOME
    fi
else
    echo "Found Warden data/config folder!"
fi

# Check if node keys is the expected one
HOST=$(hostname)
HOSTNAME=${HOST//-/_}
SRC_NODE_KEY="/tmp/keys/node_key_$HOSTNAME.json"
DST_NODE_KEY="$WARDEND_HOME/config/node_key.json"
SRC_HASH=$(sha256sum "$SRC_NODE_KEY" | awk '{ print $1 }')
DST_HASH=$(sha256sum "$DST_NODE_KEY" | awk '{ print $1 }')

if [ "$SRC_HASH" != "$DST_HASH" ]; then
    echo "Node key has changed. Copying new version..."
    cp "$SRC_NODE_KEY" "$DST_NODE_KEY"
    if [ $? -eq 0 ]; then
        echo "Node key updated successfully."
    else
        echo "Failed to update node_key"
        exit 1
    fi
else
    echo "Node Key is up to date. No action needed."
fi
