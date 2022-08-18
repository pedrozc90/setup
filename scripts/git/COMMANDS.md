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
