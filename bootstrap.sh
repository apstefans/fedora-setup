#!/usr/bin/env bash

set -e

echo "Installing packages..."
./packages.sh

echo "Installing dotfiles..."
cd dotfiles
stow bash git nvim tmux vim yazi

echo "Done"
