#!/bin/bash

# Update System
sudo apt update && sudo apt full-upgrade -y

# Source the packages File
source $HOME/dotfiles/packages.sh

# Source the dev-tools File
source $HOME/dotfiles/dev-tools/dev-tools.sh

# Source the language server File
source $HOME/dotfiles/language-server/language-server.sh
