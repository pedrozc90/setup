#!/usr/bin/env bash

# variables
IDEA_HOME="/opt/idea"

# download intellij installer
wget "https://download.jetbrains.com/idea/ideaIU-2020.1.1.tar.gz" --verbose --output-document="$HOME/Downloads/ideaIU-2020.1.1.tar.gz"

# create idea directory if not exists
if [ ! -d "$IDEA_HOME" ]; then
    sudo mkdir "$IDEA_HOME"
fi;

# extract intellij into /opt directory
sudo tar -zxvf "$HOME/Downloads/ideaIU-2020.1.1.tar.gz" -C "$IDEA_HOME" --strip-components 1

# edit permissions
sudo chmod 777 "$IDEA_HOME"

# run intellij
sh "$IDEA_HOME/bin/idea.sh"
