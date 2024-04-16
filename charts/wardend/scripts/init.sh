#!/usr/bin/env bash
set -x

#Install utils
apt update 
apt install curl jq -y > /dev/null 2>&1

WARDEND_HOME="/root/.warden"
#Check if Home data exists, if not create it.
if [ ! -d "$WARDEND_HOME/data" ] && [ ! -d "$WARDEND_HOME/config" ]; then
  if [[ "$SYNC_METHOD" == "scratch" ]]; then
    /usr/bin/wardend init --chain-id "$WARDEND_CHAIN_ID" "$WARDEND_MONIKER"
    if [[ ! -z $WARDEN_GENESIS_RPC ]]; then
      curl -s "$WARDEN_GENESIS_RPC/genesis.json" > "$WARDEND_HOME/config/genesis.json"
    fi
  elif [[ "$SYNC_METHOD" == "snapshot" ]]; then
        mkdir $WARDEND_HOME
        curl -L $SNAPSHOT_URL | tar -xzvf - -C $WARDEND_HOME
  fi
else
  echo "Found Warden data/config folder!"
fi
