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
asdf install nodejs 10.24.1 \
&& asdf install nodejs 20.10.0 \
&& asdf global nodejs 20.10.0

# install java
asdf plugin add java https://github.com/halcyon/asdf-java.git
asdf install java temurin-8.0.392+8 \
&& asdf install java temurin-11.0.21+9 \
&& asdf install java temurin-17.0.9+9 \
&& asdf global java temurin-11.0.21+9

echo ". \"$HOME/.asdf/plugins/java/set-java-home.bash\"" >> ~/.bashrc

# install graalvm
# asdf plugin add graalvm https://github.com/asdf-community/asdf-graalvm.git

# install lua
asdf plugin add lua https://github.com/Stratus3D/asdf-lua.git
asdf install lua 5.4.6
asdf global lua 5.4.6

# install elixir
asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git

# reload environment variables
source ~/.bashrc
