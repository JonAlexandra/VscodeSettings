#!/bin/bash

SETTINGS_PATH="$HOME/.config/Code/User/settings.json"
BACKUP_PATH="$HOME/.config/Code/User/settings_backup.json"
SCRIPT_PATH=$(realpath "$0")
DIRNAME=$(dirname "$SCRIPT_PATH")

if [ -L "$SETTINGS_PATH" ]; then
    echo "Settings file already exists as a symlink"
    exit 0
fi

# echo "$settings_path"
# echo "$backup_path"
echo "$DIRNAME"

# exit 0

if [ -f "$SETTINGS_PATH" ]; then
    if [ -f "backup_path" ] ; then
        echo "Both settings and backup already exists. Exiting"
        exit 1
    fi
    echo "Settings file already exists, renaming it to $BACKUP_PATH"
    mv "$SETTINGS_PATH" "$BACKUP_PATH"
fi

echo "Symlinking $DIRNAME/settings.json to $SETTINGS_PATH"
ln -s "$DIRNAME/settings.json" "$SETTINGS_PATH" | exit 1
echo "Symlink success"
