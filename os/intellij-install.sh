#!/usr/bin/env bash

# variables
IDEA_HOME="/opt/idea"
IDEA_FILE="ideaIU-2022.3.2.tar.gz"

# download intellij installer
# wget "https://download.jetbrains.com/idea/$IDEA_FILE" --verbose --output-document="$HOME/Downloads/$IDEA_FILE"

# # create idea directory if not exists
if [ ! -d "$IDEA_HOME" ]; then
    sudo mkdir "$IDEA_HOME"
fi;

# extract intellij into /opt directory
sudo tar -zxvf "$HOME/Downloads/$IDEA_FILE" -C "$IDEA_HOME" --strip-components 1

# edit permissions
sudo chmod 777 "$IDEA_HOME"

# run intellij
sh "$IDEA_HOME/bin/idea.sh"
