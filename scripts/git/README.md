# Git

```bash
# initialize a new git repository
git init

# show current repository status
git status

# insert file into commit
git add README.md

# commit changes to repository with a message
git commit -m "initial commit"

# show repository log
git log
```

```bash
# insert new changes of README.md
git add README.md
```

```bash
# amend current changes into the last commit (keep previous message)
git commit --amend --no-edit
```

```bash
# amend commit and override message
git commit --amend --message "initial commit"
```

```bash
git reset

git reset --hard
```

```bash
# create a new branch called 'development'
git branch development

# change branch
git checkout development
```
