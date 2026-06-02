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
git add .

# Commit only if there are changes
if ! git diff --cached --quiet; then
    git commit -m "Updated current version"
    git push origin main
    echo "Changes committed and pushed."
else
    echo "No changes to commit."
fi

echo "Done."
