#!/usr/bin/env bash

# download latest google chrome
wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" --verbose --directory-prefix="$HOME/Downloads"

# install package
sudo dpkg -i "$HOME/Downloads/google-chrome*.deb"
