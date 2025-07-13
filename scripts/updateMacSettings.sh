#!/bin/bash -e

# Boost key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 10
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write -g ApplePressAndHoldEnabled -bool false
