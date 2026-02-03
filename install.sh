#!/bin/bash
set -e

INSTALL_DIR="$HOME/.idle-tracker"
PLUGIN_DIR="$HOME/Library/Application Support/SwiftBar/Plugins"

# Clone or update
if [ -d "$INSTALL_DIR" ]; then
  echo "Updating Idle Tracker..."
  cd "$INSTALL_DIR" && git pull
else
  echo "Installing Idle Tracker..."
  git clone https://github.com/tednguyendev/idle.git "$INSTALL_DIR"
fi

# Symlink plugin
mkdir -p "$PLUGIN_DIR"
ln -sf "$INSTALL_DIR/plugin/idle.1m.sh" "$PLUGIN_DIR/idle.1m.sh"

echo "Done! Start SwiftBar if it's not running: open -a SwiftBar"
