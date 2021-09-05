#!/usr/bin/env bash

# import microsft GPG key
wget -q "https://packages.microsoft.com/keys/microsoft.asc" -O- | sudo apt-key add -

# enable visual studio code repository
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

# install visual tudio code
sudo apt install code -y

# verify version
code --version
