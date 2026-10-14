#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

echo "Installing packages..."
./packages.sh

echo "Installing dotfiles..."
cd dotfiles
stow -t "$HOME" bash git nvim tmux vim yazi

echo "Done."
