FROM ubuntu:20.04 AS builder

# Without interactive dialogue
ARG DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update \
    && apt-get install -y \
        curl \
        unzip \
        wget \
        gnupg2 \
        software-properties-common \
        git \
        apt-utils \
        vim \
        dirmngr \
        apt-transport-https \
        ca-certificates

# Installing NVM, NodeJS and NPM
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs

# Install Wine from WineHQ Repository
RUN dpkg --add-architecture i386 \
    && wget -qO- https://dl.winehq.org/wine-builds/Release.key | apt-key add - \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv F987672F \
    && apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' \
    && apt-get update \
    && apt-get install -y --install-recommends winehq-stable

# Installing mono
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
    && sh -c 'echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" > /etc/apt/sources.list.d/mono-official-stable.list' \
    && apt-get update \
    && apt-get install -y mono-complete

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rfv aws awscliv2.zip
