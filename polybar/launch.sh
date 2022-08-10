#!/usr/bin/env bash

echo "Polybars launch..."

# Terminate already running istances
# Avoid the creation of N polybars with i3 restart
polybar-msg cmd quit

# Launch bar
polybar danielebar

echo "Polybars launched!"
