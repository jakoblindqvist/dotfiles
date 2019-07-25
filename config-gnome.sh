#!/bin/bash

# Configurations for gnome.

# Make the calendar show week numbers.
gsettings set org.gnome.desktop.calendar show-weekdate true

# Make workspaces extend across multiple screens.
gsettings set org.gnome.mutter workspaces-only-on-primary false

# Only let the dock reference windows in the current workspace.
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces true
