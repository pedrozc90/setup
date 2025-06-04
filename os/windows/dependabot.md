# [GitHub CLI](https://github.com/cli/cli/blob/trunk/docs/install_linux.md)

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
