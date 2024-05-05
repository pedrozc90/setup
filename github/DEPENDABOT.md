# Dependabot

## References

-   [Dependabot CLI](https://github.com/dependabot/cli)
-   Action [dependabot/fetch-metadata](https://github.com/dependabot/fetch-metadata)
-   [Automating Dependabot with GitHub Actions](https://docs.github.com/en/code-security/dependabot/working-with-dependabot/automating-dependabot-with-github-actions)
-   [Dependabot Configuration](https://docs.github.com/en/code-security/dependabot/dependabot-version-updates/configuration-options-for-the-dependabot.yml-file)

## Setup

### 1. Check if Dependabot is already enabled

### 2. Create `.github/dependabot.yml`

```yml
# To get started with Dependabot version updates, you'll need to specify which
# package ecosystems to update and where the package manifests are located.
# Please see the documentation for all configuration options:
# https://docs.github.com/github/administering-a-repository/configuration-options-for-dependency-updates

version: 2
updates:
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "monthly"
```
