#!/bin/bash
#
HORCRUX_HOME=/home/horcrux/.horcrux
SECRETS=/tmp/secrets

# Check if the directory exists
if [ -d "$HORCRUX_HOME" ]; then
    echo "Directory exists at $HORCRUX_HOME"
else
    echo "Directory does not exist at $HORCRUX_HOME"
    mkdir -p $HORCRUX_HOME
fi

# Check that all files are present
for file in "$SECRETS"/*; do
    # Get the base name of the file
    filename=$(basename "$file")

    # Check if the file exists in the destination directory
    if [ -f "$HORCRUX_HOME/$filename" ]; then
        echo "File $filename already exists in $HORCRUX_HOME. Skipping..."
    else
        echo "File $filename does not exist in $HORCRUX_HOME. Copying..."
        cp "$file" "$HORCRUX_HOME/"
        if [ $? -eq 0 ]; then
            echo "File $filename copied successfully."
        else
            echo "Failed to copy $filename."
        fi
    fi
done
