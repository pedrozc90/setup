# Addons

## Verify Current Execution Policy

```ps1
# list all execution policies
Get-ExecutionPolicy -List
```

## Temporarily Allow Script Execution

```ps1
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

## Permanently Allow Script Execution

```ps1
# change current user execution policy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```
