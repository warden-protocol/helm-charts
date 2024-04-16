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
    /usr/bin/wardend init --chain-id "$WARDEND_CHAIN_ID" "$WARDEND_MONIKER"
    if [[ ! -z $WARDEN_GENESIS_RPC ]]; then
      curl -s "$WARDEN_GENESIS_RPC/genesis.json" > "$WARDEND_HOME/config/genesis.json"
    fi
  elif [[ "$SYNC_METHOD" == "snapshot" ]]; then
        mkdir $WARDEND_HOME
        curl -L $SNAPSHOT_URL | tar -xzvf - -C $WARDEND_HOME
  fi
else
  echo "Found Warden data folder!"
fi
