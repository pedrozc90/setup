# WINDOWS

Roadmap of windows instllation to get my computer ready for development

+   System
    -   [ASUS ROG Strix X570-e Driver](https://rog.asus.com/motherboards/rog-strix/rog-strix-x570-e-gaming-model/helpdesk_download/)
        -   Armoury Crate
    -   [AMD Driver Radeon RX590](https://www.amd.com/en/support/graphics/radeon-500-series/radeon-rx-500-series/radeon-rx-590)

+   Required
    -   [Git](https://git-scm.com/)
    -   [GitHub Desktop](https://desktop.github.com/)
    -   [7Zip](https://www.7-zip.org/)
    -   [Visual Studio Code](https://code.visualstudio.com/)
    -   [Docker Desktop](https://www.docker.com/)
        - Required WSL version 2
    -   [Postman](https://www.postman.com/)
    -   [IntelliJ](https://www.jetbrains.com/idea/)

+   Programming Languages
    -   [Elixir](https://elixir-lang.org/install.html)
    -   [NodeJs](https://nodejs.org/en/)
    -   [Go Lang](https://golang.org/)
    -   [Java SDK](https://developers.redhat.com/products/openjdk/download)
    -   [Python 3.9](https://www.python.org/downloads/)

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

## Fix PowerShell Script Policy

```ps1
# list all execution policies
Get-ExecutionPolicy -List
```

```ps1
# change current user execution policy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## WSL

### Setup

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

### Install `asdf` using script [asdf-install.sh](../asdf-install.sh)

-   Java v21
-   NodeJS v20

### Installation

-   [asdf](../asdf-install.sh)
    -   nodejs
    -   java
-   **go lang** `sudo apt install golang-go -y`

#### [GitHub CLI](https://github.com/cli/cli/blob/trunk/docs/install_linux.md)

```bash
# install github CLI
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y
```

```bash
# login into github
sudo su
gh auth login

# install dependabot CLI
gh gist view --raw e09e1ecd76d5573e0517a7622009f06f | bash
```

> [Depdendabot CLI](https://github.com/dependabot/cli)

### Commands

```ps1
# open wsl folder using windows vscode
code --remote wsl+Ubuntu-22.04 /home/pedrozc90/.github/printer-mock
```
