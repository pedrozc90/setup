#!/usr/bin/env bash

# variables
POSTMAN_HOME="/opt/postman"

wget "https://dl.pstmn.io/download/latest/linux64" --verbose --output-document="$HOME/Downloads/postman-linux-x64-7.24.0.tar.gz"

# create postman directory if not exists
if [ ! -d "$POSTMAN_HOME" ]; then
    sudo mkdir -v "$POSTMAN_HOME"
fi;

# extract postman application
sudo tar -zxvf "$HOME/Downloads/postman-linux-x64-7.24.0.tar.gz" -C "$POSTMAN_HOME" --strip-components 1

# copy desktop icon into start menu
sudo cp -v postman.desktop ~/.local/share/applications/
