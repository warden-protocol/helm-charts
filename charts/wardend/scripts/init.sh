#!/usr/bin/env ash
set -x

#Install utils
apk update 
apk --no-cache add ca-certificates curl jq > /dev/null 2>&1

# fail fast should there be a problem installing curl / jq packages
type curl || exit 1
type jq || exit 1

#Check if Home data exists, if not create it.
if [ ! -d "$WARDEND_HOME/data" ]; then
  if [[ "$SYNC_METHOD" == "scratch" ]]; then
    /usr/bin/wardend init --chain-id "$WARDEND_CHAIN_ID" --moniker "$WARDEND_MONIKER"
    mkdir -p "$WARDEND_HOME/config" || exit 1
    curl -s "$WARDEND_NET/genesis.json" > "$WARDEND_HOME/config/genesis.json"
  elif [[ "$SYNC_METHOD" == "snapshot" ]]; then
        mkdir $WARDEND_HOME
        curl -L $SNAPSHOT_URL | tar -xzvf - -C $WARDEND_HOME
  fi
else
  echo "Found Warden data folder!"
fi
if [ -f "/scripts/node_key.json" ]; then
  cp -f /scripts/node_key.json $WARDEND_HOME/config/node_key.json;
fi
