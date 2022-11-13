#!/bin/bash

if [ $EUID -ne 0 ]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi

# check version
CHROME_VERSION=$(google-chrome --version | grep -Po '(\d+\.\d+\.\d+\.\d+)')

if [ -z $CHROME_VERSION ]; then
	sudo apt update
	sudo apt install wget fonts-liberation xdg-utils

	# download google-chrome
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

	# install from downlaoded file
	sudo dpkg -i google-chrome-stable_current_amd64.deb
fi

CHROMEDRIVER_VERSION=108.0.5359.22
# CHROMEDRIVER_VERSION=107.0.5304.62
# CHROMEDRIVER_VERSION=106.0.5249.61
CHROMEDRIVER_DIR="/usr/bin/chromedriver"

# download chromedriver for linux
wget "https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip"

# remove old chromedriver, if exists
rm -vf $CHROMEDRIVER_DIR

# extract files
unzip chromedriver_linux64.zip -d /usr/bin

sudo chown root:root $CHROMEDRIVER_DIR
sudo chmod +x $CHROMEDRIVER_DIR

rm -vf "${PWD}/chromedriver_linux64.zip"
rm -vf "${PWD}/google-chrome-stable_current_amd64.deb"
