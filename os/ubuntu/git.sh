#!/usr/bin/env bash

# install git
sudo apt install git -y

# check git version
git --version

# configure git glocal user
git config --global user.name "pedrozc90"
git config --global user.email "pedrozc90@gmail.com"

# printout git configuration
git config --list

# clone projects
# git clone git@gitlab.com:contare-team/contare-pedidos.git
# git clone git@gitlab.com:contare-team/contare-fornecedor-biro.git
# git clone git@gitlab.com:contare-team/confinfra.git
