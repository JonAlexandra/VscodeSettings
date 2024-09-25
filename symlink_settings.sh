#!/bin/bash

SETTINGS_PATH="$HOME/.config/Code/User/settings.json"
BACKUP_SETTINGS_PATH="$HOME/.config/Code/User/settings_backup.json"

KEYBINDINGS_PATH="$HOME/.config/Code/User/keybindings.json"
BACKUP_KEYBINDINGS_PATH="$HOME/.config/Code/User/keybindings_backup.json"

SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIRNAME=$(dirname "$SCRIPT_PATH")

if [ ! -L "$SETTINGS_PATH" ]; then

    if [ -f "$SETTINGS_PATH" ]; then
        if [ -f "backup_path" ] ; then
            echo "Both settings and backup already exists. Exiting"
            exit 1
        fi
        echo "Settings file already exists, renaming it to $BACKUP_SETTINGS_PATH"
        mv "$SETTINGS_PATH" "$BACKUP_SETTINGS_PATH"
    fi

    echo "Symlinking $SCRIPT_DIRNAME/settings.json to $SETTINGS_PATH"
    ln -s "$SCRIPT_DIRNAME/settings.json" "$SETTINGS_PATH" | exit 1
    echo "Symlinking settings success"
else
    echo "Settings symlink already exists (not checked if it is valid though)"
fi

if [ ! -L "$KEYBINDINGS_PATH" ]; then

    if [ -f "$KEYBINDINGS_PATH" ]; then
        if [ -f "backup_path" ] ; then
            echo "Both settings and backup already exists. Exiting"
            exit 1
        fi
        echo "Settings file already exists, renaming it to $BACKUP_KEYBINDINGS_PATH"
        mv "$KEYBINDINGS_PATH" "$BACKUP_KEYBINDINGS_PATH"
    fi

    echo "Symlinking $SCRIPT_DIRNAME/keybindings.json to $KEYBINDINGS_PATH"
    ln -s "$SCRIPT_DIRNAME/keybindings.json" "$KEYBINDINGS_PATH" | exit 1
    echo "Symlinking keybindings success"
else
    echo "Keybindings symlink already exists (not checked if it is valid though)"
fi



