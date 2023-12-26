# Commands

## Search in Git

```bash
git rev-list --all | xargs git grep -F 'docker'
```

## Clean up local branches

```bash
git config --global fetch.prune true
```

> Remove any local branches that have been merged with our

```bash
git branch --merged master | grep -v "master" | xargs -n 1 git branch --delete
```

## Count Commits

```bash
git rev-list --count master
```

## View File of Another Branch

```bash
git show master:src/index.ts
```

## Blank Commits

```bash
git commit --allow empty --message "new empty commit"
```

> This will trigger workflows without having to make changes to our code.

## Blank Commits

```bash
git config --global help.autocorrent 1
```

## Automatically Prune

```bash
git config --global fetch.prune true
```

## Take a backup of untracked files

```bash
git ls-files --others --exclude-standard -z | xargs -0 tar rvf ~/backup-untracked.zip
```

## SubModules

```bash
git submodule add --branch <branch_name> <repository_url> <path>
```

```bash
# Clone the Tukui repository and its submodules
git clone --recursive https://github.com/your_username/Tukui.git

# If you already cloned without the --recursive flag, or need to update submodules:
cd Tukui
git submodule update --init --recursive
```

```bash
# Navigate to the Submodule
cd Tukui/Libs/oUF_Retail

# List Remote Branches
git branch -r

# Checkout the "retail" Branch
git checkout -b retail origin/retail

git pull origin retail
```

```bash
cd ../../..
git add Tukui/Libs/oUF_Retail
git commit -m "Update oUF submodule to the latest version on the retail branch"
git push origin master
```
