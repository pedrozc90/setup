# WINDOWS

Roadmap of windows installation to get my computer ready for development

## Spec

-   Motherboard: `ROG Strix X570-E Gaming`
-   CPU: `AMD Ryzen 7 2700X`
-   GPU: `AMD Radeon Sapphire RX7800XT`

## Overview

+   System
    -   [ASUS ROG Strix X570-e Driver](https://rog.asus.com/motherboards/rog-strix/rog-strix-x570-e-gaming-model/helpdesk_download/)
        -   Armoury Crate
    -   [AMD]
        -   [Radeon RX590](https://www.amd.com/en/support/graphics/radeon-500-series/radeon-rx-500-series/radeon-rx-590)
        -   [Radeon RX 7800 XT](https://www.amd.com/en/support/download/drivers.html)

+   Required
    -   [Git](https://git-scm.com/)
    -   [GitHub Desktop](https://desktop.github.com/)
    -   [7Zip](https://www.7-zip.org/)
    -   [Visual Studio Code](https://code.visualstudio.com/)
    -   [Docker Desktop](https://www.docker.com/) - requires `WSL2`
    -   [Postman](https://www.postman.com/)
    -   [IntelliJ](https://www.jetbrains.com/idea/)

+   Programming Languages
    -   [Elixir](https://elixir-lang.org/install.html)
    -   [NodeJs](https://nodejs.org/en/)
    -   [Go Lang](https://golang.org/)
    -   [Java SDK](https://developers.redhat.com/products/openjdk/download)
    -   [Python 3.9](https://www.python.org/downloads/)
    -   [Lua 5.4](https://www.lua.org/)
    -   [Luarocks](https://luarocks.org/)

+   Games
    -   [Battle.net](https://www.blizzard.com/en-us/download/)
        -   World of Warcraft
        -   World of Warcraft Classic
    -   [Steam](https://store.steampowered.com/about/)

+   Utils
    -   [Google Chrome](https://www.google.com/chrome/)
    -   [Discord](https://discord.com/)
    -   [Spotify](https://www.spotify.com/us/)
    -   [Windows Terminal](https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701?activetab=pivot:overviewtab)
    -   [Google Drive](https://www.google.com/drive/download/)
    -   [Razer Synapse v2](https://www.razer.com/synapse-2)
    -   [Razer Synapse v3](https://www.razer.com/synapse-3)

## Roadmaps

### WSL

#### Setup

```bash
# update lsit of packages
sudo apt update

# upgrade system
sudo apt upgrade

# download some packages
sudo apt install -y \
    git \
    dos2unix \
    python3-pip \
    python3-venv

# install elixir
sudo apt install -y elixir erlang-dev erlang-xmerl
```

#### Mise

```bash
# install mise cli
curl https://mise.run | sh

# check mise version
~/.local/bin/mise --version
```

```bash
# activate mise
echo 'eval "$(~/.local/bin/mise activate bash)"' >> ~/.bashrc
```

```bash
# install java 21
mise install java@temurin-21.0.7+6.0.LTS
```

```bash
# fix lua mise plugin
dos2unix ~/.local/share/mise/plugins/lua/bin/download
dos2unix ~/.local/share/mise/plugins/lua/bin/exec-env
dos2unix ~/.local/share/mise/plugins/lua/bin/install
dos2unix ~/.local/share/mise/plugins/lua/bin/list-all
dos2unix ~/.local/share/mise/plugins/lua/bin/list_bin-paths
dos2unix ~/.local/share/mise/plugins/lua/lib/utils.sh

# install lua version 5.4.7
mise install lua@5.4.7

# install elixir
mise install erlang
mise install elixir@1.18.4
```

```bash
# setup globals
mise use --global node@22
mise use --global lua@5.4.7
mise use --global java@temurin-21.0.7+6.0.LTS
```

## Utility

### Commands

```ps1
# open wsl folder using windows vscode
code --remote wsl+Ubuntu-22.04 /home/pedrozc90/.github/printer-mock
```

### Fix PowerShell Script Policy

```ps1
# list all execution policies
Get-ExecutionPolicy -List
```

```ps1
# change current user execution policy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```
