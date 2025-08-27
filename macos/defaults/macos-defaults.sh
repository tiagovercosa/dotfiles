#!/bin/bash
# macOS system preferences configuration

# Set dock to auto-hide
defaults write com.apple.dock autohide -bool true

# Show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true

# Set fast key repeat
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Show filename extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Restart affected services
killall Dock
killall Finder