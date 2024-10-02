#!/usr/bin/env bash
set -x

# Check EIP
if [ -n "$EIP_CHECK" ]; then
    while true; do
        if [ -n "$EIP" ]; then
            echo "EIP is set: $EIP";
            exit 0;
        fi
        echo "Waiting for EIP.";
        sleep 15;
    done
fi

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
SRC_NOKE_KEY="/tmp/keys/node_key_$HOSTNAME.json"
DST_NOKE_KEY="$WARDEND_HOME/config/node_key.json"
SRC_HASH=$(sha256sum "$SRC_NODE_KEY" | awk '{ print $1 }')
DST_HASH=$(sha256sum "$DST_NOKE_KEY" | awk '{ print $1 }')

if [ -e "$SRC_NOKE_KEY" ]; then
  if [ "$SRC_HASH" != "$DST_HASH" ]; then
    echo "Node key has changed. Copying new version..."
    cp "$SRC_NOKE_KEY" "$DST_NOKE_KEY"
    if [ $? -eq 0 ]; then
        echo "Node key updated successfully."
    else
        echo "Failed to update node_key"
        exit 1
    fi
  else
      echo "Node Key is up to date. No action needed."
  fi
fi

if [ -n "$EIP_CHECK" ]; then
    if [ -z "$EIP_RETRIES" ]; then
        echo "EIP_RETRIES is not set";
        exit 1;
    fi
    for i in $(seq 1 $EIP_RETRIES); do
        if [ -n "$EIP" ]; then
            echo "EIP is set: $EIP";
            exit 0;
        fi;
        echo "Waiting for EIP ('$i'/$EIP_RETRIES)...";
        sleep 15;
    done;
    echo "EIP not set after $EIP_RETRIES attempts";
    exit 1;
fi

