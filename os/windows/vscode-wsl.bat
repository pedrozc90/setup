@echo off

REM --- CONFIG ---
set DISTRO=Debian
set BASE_PATH=/home/pedrozc90/.github

REM --- VALIDATION ---
if "%~1"=="" (
    echo Usage: vscode-wsl.bat repo-name
    exit /b 1
)

REM --- BUILD FULL PATH ---
set REPO=%~1
set FULL_PATH=%BASE_PATH%/%REPO%

REM --- OPEN IN VSCODE ---
code --remote wsl+%DISTRO% "%FULL_PATH%"
