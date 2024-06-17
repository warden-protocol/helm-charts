#!/usr/bin/env bash
set -x

COSMOVISOR_LOCATION="$WARDEND_HOME/cosmovisor/bin/cosmovisor"
WARDEND_BINARY="$WARDEND_HOME/cosmovisor/genesis/bin/wardend"
COSMOVISOR_URL="https://github.com/cosmos/cosmos-sdk/releases/download/cosmovisor/${COSMOVISOR_VERSION}/cosmovisor-${COSMOVISOR_VERSION}-linux-amd64.tar.gz"

#Check if Home data exists, if not create it.
if [ ! -d "$WARDEND_HOME/cosmovisor" ] || [ ! -d "$WARDEND_HOME/cosmovisor/genesis/bin" ] || [ ! -f "$COSMOVISOR_LOCATION" ]|| [ ! -f "$WARDEND_BINARY" ]; then
  echo "Creating cosmovisor folders"
  mkdir -p $WARDEND_HOME/cosmovisor/genesis/bin && mkdir -p $WARDEND_HOME/cosmovisor/genesis/upgrades
  mkdir -p $WARDEND_HOME/cosmovisor/bin

  # Check if curl is installed, this can be removed after release > 0.3.0
  if command -v curl &> /dev/null; then
    apt update && apt install -y curl
  end
  echo "Downloading Cosmovisor"
  # Download the file
  curl -Lo /tmp/cosmovisor.tar.gz "$COSMOVISOR_URL"
  # Check if the download was successful
  if [ $? -eq 0 ]; then
      echo "File downloaded successfully"
      echo "Extracting the file..."
      # Extract the file
      tar -xzf /tmp/cosmovisor.tar.gz -C /tmp
      
      # Move the extracted file to the destination
      mv /tmp/cosmovisor "$COSMOVISOR_LOCATION"
      
      # Check if the move was successful
      if [ $? -eq 0 ]; then
          echo "File moved to $COSMOVISOR_LOCATION successfully"
      else
          echo "Failed to move the file to $COSMOVISOR_LOCATION"
      fi
  else
      echo "Failed to download the file from $COSMOVISOR_URL"
  fi

  if [ ! -f "$WARDEND_BINARY" ]; then
    echo "Copying the Wardend binary as the genesis binary"
    cp /usr/bin/wardend $WARDEND_BINARY
  else
    echo "Found Wardend binary, skipping!"
  fi
else
  echo "Found Cosmovisor folder & binary, skipping!"
fi
