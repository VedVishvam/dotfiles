#!/bin/bash

# Update System
sudo apt update && sudo apt full-upgrade -y

# Source the packages File
source $HOME/Dotfiles/packages.sh

# Source the Neovim File
source $HOME/Dotfiles/neovim.sh
