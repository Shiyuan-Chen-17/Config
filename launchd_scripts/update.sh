#!/bin/zsh
# Maintenance script for oh-my-zsh and Homebrew updates

# Source zsh profile to get proper environment and aliases
source ~/.zshrc

# oh-my-zsh update
echo "[$(date)] Starting oh-my-zsh update..."
omz update

# Homebrew updates - modern approach (no sudo needed for most commands)
echo "[$(date)] Starting Homebrew updates..."
brew update
brew upgrade
brew autoremove

# The final cleanup command might need sudo depending on your setup
# Try without sudo first; if it fails, request it
echo "[$(date)] Running Homebrew cleanup..."
brew cleanup -s --prune=all

echo "[$(date)] OMZ and Brew updated"
