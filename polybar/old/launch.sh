#!/usr/bin/env bash
DIR="$HOME/.config/polybar/old"

echo "Polybars launch..."

# Terminate already running istances
# Avoid the creation of N polybars with i3 restart
polybar-msg cmd quit

# Launch bar
polybar -q danielebar -c "$DIR/config.ini" &

echo "Polybars launched!"
