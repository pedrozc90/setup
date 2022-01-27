#!/usr/bin/env bash

# --------------------------------------------------
# INSTALLATION:
# --------------------------------------------------

# clone asdf repository
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"

# append to ~/.bashrc
echo '' >> ~/.bashrc
echo '# asdf configurations' >> ~/.bashrc
echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo '. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc

# reload environment variables
source ~/.bashrc

# --------------------------------------------------
# PLUGIN: NODE.JS
# --------------------------------------------------
asdf plugin add nodejs

# import the nodejs release team's OpenPGP keys to main keyring:
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

# install nodejs
asdf install nodejs 12.16.3
asdf install nodejs 10.16.1

# set global nodejs version to 12.16.3 
asdf global nodejs 12.16.3

# set local nodejs to 10.16.1 for projects folder
cd ~/projects
asdf local nodejs 10.16.1

# verify version
node --version

# --------------------------------------------------
# PLUGIN: JAVA
# --------------------------------------------------
# install java
asdf plugin add java

# display installed plugins
asdf plugin list

# install java openjdk 8
asdf install java adopt-openjdk-8u252-b09

# set JAVA_HOME
echo '. $HOME/.asdf/plugins/java/set-java-home.bash' >> ~/.bashrc

# set global java version
asdf global java adopt-openjdk-8u252-b09

# verify version
java -version

# --------------------------------------------------
# PLUGIN: LUA
# --------------------------------------------------
asdf plugin add lua
