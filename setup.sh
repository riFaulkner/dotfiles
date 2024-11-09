#!/bin/bash

# Make sure the config default variable is set
# I'll have to look up what this var is called its like XDF_CONFIG_HOME

# Install the required packages
# use the brewfile
brew bundle install --file=Brewfile

# setup the .zshrc to use the cli_config file
# TODO: how can I check the file to make sure it doesn't already contain this?
"~/.config/dotfiles/cli_config.sh" >> ~/.zshrc

# Create symlink for nvim
ln -s ~/.config/dotfiles/nvim ~/.config/nvim
