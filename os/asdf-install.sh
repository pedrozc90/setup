#!/usr/bin/env bash

# --------------------------------------------------
# INSTALLATION:
# --------------------------------------------------

# clone asdf repository
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.0

# append to ~/.bashrc
echo -e "\n# asdf configurations" >> ~/.bashrc
echo ". \"$HOME/.asdf/asdf.sh\"" >> ~/.bashrc
echo ". \"$HOME/.asdf/completions/asdf.bash\"" >> ~/.bashrc

# reload environment variables
source ~/.bashrc

# install nodejs
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 10.24.1
asdf install nodejs 20.10.0
asdf global nodejs 20.10.0

# install java
asdf plugin add java https://github.com/halcyon/asdf-java.git
asdf install java adoptopenjdk-8.0.362+9
asdf install java adoptopenjdk-17.0.6+10
asdf global java adoptopenjdk-17.0.6+10

echo ". ~/.asdf/plugins/java/set-java-home.bash" >> ~/.bashrc

source ~/.bashrc

# install lua
asdf plugin add lua https://github.com/Stratus3D/asdf-lua.git
asdf install lua 5.4.6
asdf global lua 5.4.6

# install elixir
asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
