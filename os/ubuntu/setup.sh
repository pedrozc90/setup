#!/usr/bin/env bash

# update ubuntu repository
sudo apt update -y

# upgrade ubuntu
sudo apt upgrade -y

# install basic packages
sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common jq -y
sudo apt install gnome-tweaks chrome-gnome-shell htop net-tools -y

# change directory
cd "$HOME/Downloads"

# install git
sh git.sh

# install docker
sh docker.sh

# install vscode
sh vscode.sh

# install google-chome
sh google-chrome.sh

# install asdf
sh asdf.sh

# install ssnap packages
sudo snap install spotify
sudo snap install slack --classic

# cleaning
sudo apt update
sudo apt autoclean
sudo apt autoremove -y

# RESULT=`node --version`
# echo "node version: $RESULT"

# --------------------------------------------------
# FIX WINDOWS DUAL BOOT TIME OFFSET
# --------------------------------------------------

# making linux use local time the same way windows
# timedatectl set-local-rtc 1 --adjust-system-clock

# reset change
# timedatectl set-local-rtc 0 --adjust-system-clock
