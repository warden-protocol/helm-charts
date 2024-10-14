#!/usr/bin/env bash

set -ex

if [ -n "${EIP_CHECK}" ]; then
  echo "EIP_CHECK is set. Waiting for EIP to be populated..."
  while [ -z "$EIP" ]; do
    echo "EIP is not set yet. Sleeping for 5 seconds..."
    sleep 5
  done
  echo "EIP is now set. Starting /usr/bin/wardend with flags: $@"
  /usr/bin/wardend start "$@"
else
  /usr/bin/wardend start "$@"
fi
