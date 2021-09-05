#!/usr/bin/env bash

# --------------------------------------------------
# INSTALLATION:
# --------------------------------------------------

# install docker and docker-compose
supo apt install docker.io docker-compose -y

# check docker version
docker --version
docker-compose --version

# --------------------------------------------------
# CONFIGURATION:
# --------------------------------------------------

# create the docker group
# sudo groupadd docker

# add the current user to the docker group
# sudo usermod -aG docker $USER

# enable docker start on boot
# sudo systemctl enable docker
