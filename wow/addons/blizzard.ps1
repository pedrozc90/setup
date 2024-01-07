# https://www.undocumented-features.com/2022/03/03/creating-a-symlink-on-windows-11/

$WOW_DIR = "C:\Blizzard\World of Warcraft"
$GITHUB_DIR = "C:\Users\$env:USERNAME\Documents\GitHub"

$TUKUI_DIR = "$GITHUB_DIR\Tukui\Tukui"
$LUAUI_DIR = "$GITHUB_DIR\LuaUI"
$FILGER_DIR = "$GITHUB_DIR\Filger"

$RETAIL_DIR = "$WOW_DIR\_retail_"
if (Test-Path $RETAIL_DIR) {
    $ADDONS_DIR = "$RETAIL_DIR\Interface\AddOns"
    New-Item -ItemType SymbolicLink -Path "$ADDONS_DIR\Tukui" -Target "$TUKUI_DIR" -Force
    New-Item -ItemType SymbolicLink -Path "$ADDONS_DIR\LuaUI" -Target "$LUAUI_DIR" -Force
    New-Item -ItemType SymbolicLink -Path "$ADDONS_DIR\Filger" -Target "$FILGER_DIR" -Force
}

$CLASSIC_ERA_DIR = "$WOW_DIR\_classic_era_"
if (Test-Path $CLASSIC_ERA_DIR) {
    $ADDONS_DIR = "$CLASSIC_ERA_DIR\Interface\AddOns"
    New-Item -ItemType SymbolicLink -Path "$ADDONS_DIR\Tukui" -Target "$TUKUI_DIR" -Force
    New-Item -ItemType SymbolicLink -Path "$ADDONS_DIR\LuaUI" -Target "$LUAUI_DIR" -Force
    New-Item -ItemType SymbolicLink -Path "$ADDONS_DIR\Filger" -Target "$FILGER_DIR" -Force
}

$CLASSIC_DIR = "$WOW_DIR\_classic_"
if (Test-Path $CLASSIC_DIR) {
    $ADDONS_DIR = "$CLASSIC_DIR\Interface\AddOns"
    New-Item -ItemType SymbolicLink -Path "$ADDONS_DIR\Tukui" -Target "$TUKUI_DIR" -Force
    New-Item -ItemType SymbolicLink -Path "$ADDONS_DIR\LuaUI" -Target "$LUAUI_DIR" -Force
    New-Item -ItemType SymbolicLink -Path "$ADDONS_DIR\Filger" -Target "$FILGER_DIR" -Force
}
