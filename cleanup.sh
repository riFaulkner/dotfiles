#!/bin/bash

source "$(dirname "$0")/config.sh"

echo "This will remove all dotfile symlinks and configs."
read -p "Are you sure? (yes/no): " confirm

if [ "$confirm" != "yes" || "$confirm" != 'y' ]; then
    echo "Aborted."
    exit 0
fi

for ((i=0; i<${#links[@]}; i+=2)); do
    # we actually just need the target
    target="${links[$i]}"
    
    if [ -e "$target" ] || [ -L "$target" ]; then
        rm -rf "$target"
        echo "Removed $target"
    fi
done


if [ -d "$TPM_DIR" ]; then
    rm -rf "$TPM_DIR"
fi

echo "Done cleaning 🧹✨"
