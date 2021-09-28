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

## Create Repository Command-Line

1.  Create Authentication token on [Settings](https://github.com/settings/tokens)
2.  Create new repository using GitHub RestAPI

```bash
curl -H "Authorization: token ${TOKEN}" \
    -d '{ "name": "${REPOSITORY_NAME}", "private": false, "auto-init": false }' \
    https://api.github.com/user/repos
```

> Reference https://docs.github.com/en/rest/guides/getting-started-with-the-rest-api

3.  Create your local repository

```bash
# create local repositoru folder
mkdir ${REPOSITORY_NAME}

# initialize git repository
git init

# create a README.md file
echo "# ${REPOSITORY_NAME}" >> README.md

# create .gitignore file
touch .gitignore

# create .gitattributes file
echo "# Auto detect text files and perform LF normalization" >> .gitattributes
echo "* text=auto" >> .gitattributes

# index all repository files
git add --verbose --all

# create a commit
git commit --message "initial commit"

# link local repository to a remote repository
git remote add origin git@github.com:${USER}/${REPOSITORY_NAME}.git

# push to github
git push -u origin master
```
