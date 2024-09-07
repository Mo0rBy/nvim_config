#!/bin/zsh

echo "--- brew update & upgrade ---"
brew update
brew upgrade
brew upgrade --cask
brew cleanup
