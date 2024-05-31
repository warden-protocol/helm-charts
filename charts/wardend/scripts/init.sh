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
