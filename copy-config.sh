#!/bin/bash

set -e

REAL_HOME=$(eval echo "~${SUDO_USER:-$USER}")

SOURCE="$REAL_HOME/.config"
DEST="$REAL_HOME/Documents/LinuxFedoraConfig/.config"
REPO="$REAL_HOME/Documents/LinuxFedoraConfig"

# Create destination directory if it doesn't exist
mkdir -p "$DEST"

# Copy selected config folders
for dir in hypr kitty rofi waybar; do
    if [ -d "$SOURCE/$dir" ]; then
        rsync -av --delete "$SOURCE/$dir/" "$DEST/$dir/"
        echo "Synced: $dir"
    else
        echo "Warning: $SOURCE/$dir does not exist"
    fi
done

# Change to repository directory
cd "$REPO"

# Stage all changes
if [ -n "$SUDO_USER" ]; then
    sudo -u "$SUDO_USER" git add .
    if ! sudo -u "$SUDO_USER" git diff --cached --quiet; then
        sudo -u "$SUDO_USER" git commit -m "Updated current version"
        sudo -u "$SUDO_USER" git push origin main
    fi
else
    git add .
    if ! git diff --cached --quiet; then
        git commit -m "Updated current version"
        git push origin main
    fi
fi
# Commit only if there are changes


echo "Done."
