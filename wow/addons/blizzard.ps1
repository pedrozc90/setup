# https://www.undocumented-features.com/2022/03/03/creating-a-symlink-on-windows-11/

$BLIZZARD_DIR = "C:\Blizzard"
$WOW_DIR = "$BLIZZARD_DIR\World of Warcraft"
$GITHUB_DIR = "C:\Users\$env:USERNAME\github"

$TUKUI_DIR = "$GITHUB_DIR\Tukui\Tukui"
$LUAUI_DIR = "$GITHUB_DIR\LuaUI"
$FILGER_DIR = "$GITHUB_DIR\Filger"
$OUF_LUA_DIR = "$GITHUB_DIR\oUF_Lua"
$JASJE_UI_DIR = "$GITHUB_DIR\JasjeUI"

# New-Item -ItemType SymbolicLink -Path "C:\Users\pedro\github\Tukui\Tukui\Libs\oUF_Test" -Target "C:\Users\pedro\github\oUF" -Force
# New-Item -ItemType SymbolicLink -Path "$TUKUI_DIR\Libs\oUF_Test" -Target "$GITHUB_DIR\oUF" -Force

$RETAIL_DIR = "$WOW_DIR\_retail_"
if (Test-Path $RETAIL_DIR) {
    $ADDONS_DIR = "$RETAIL_DIR\Interface\AddOns"
    New-Item -ItemType SymbolicLink -Path "$ADDONS_DIR\Tukui" -Target "$TUKUI_DIR" -Force
    New-Item -ItemType SymbolicLink -Path "$ADDONS_DIR\LuaUI" -Target "$LUAUI_DIR" -Force
    New-Item -ItemType SymbolicLink -Path "$ADDONS_DIR\Filger" -Target "$FILGER_DIR" -Force
    # New-Item -ItemType SymbolicLink -Path "$ADDONS_DIR\oUF_Lua" -Target "$OUF_LUA_DIR" -Force
    New-Item -ItemType SymbolicLink -Path "$ADDONS_DIR\JasjeUI" -Target "$JASJE_UI_DIR" -Force
}

$CLASSIC_DIR = "$WOW_DIR\_classic_"
if (Test-Path $CLASSIC_DIR) {
    $ADDONS_DIR = "$CLASSIC_DIR\Interface\AddOns"
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
    # New-Item -ItemType SymbolicLink -Path "$ADDONS_DIR\oUF_Lua" -Target "$OUF_LUA_DIR" -Force
}

$CLASSIC_ERA_DIR = "$WOW_DIR\_classic_ptr_"
if (Test-Path $CLASSIC_ERA_DIR) {
    $ADDONS_DIR = "$CLASSIC_ERA_DIR\Interface\AddOns"
    New-Item -ItemType SymbolicLink -Path "$ADDONS_DIR\Tukui" -Target "$TUKUI_DIR" -Force
    New-Item -ItemType SymbolicLink -Path "$ADDONS_DIR\LuaUI" -Target "$LUAUI_DIR" -Force
    New-Item -ItemType SymbolicLink -Path "$ADDONS_DIR\Filger" -Target "$FILGER_DIR" -Force
    # New-Item -ItemType SymbolicLink -Path "$ADDONS_DIR\oUF_Lua" -Target "$OUF_LUA_DIR" -Force
}

# CLASSIC WRATH PTR
$PTR_DIR = "$WOW_DIR\_ptr_"
if (Test-Path $PTR_DIR) {
    $ADDONS_DIR = "$PTR_DIR\Interface\AddOns"
    New-Item -ItemType SymbolicLink -Path "$ADDONS_DIR\Tukui" -Target "$TUKUI_DIR" -Force
    New-Item -ItemType SymbolicLink -Path "$ADDONS_DIR\LuaUI" -Target "$LUAUI_DIR" -Force
    New-Item -ItemType SymbolicLink -Path "$ADDONS_DIR\Filger" -Target "$FILGER_DIR" -Force
}

# CLASSIC ERA PTR
$PTR_DIR = "$WOW_DIR\_ptr2_"
if (Test-Path $PTR_DIR) {
    $ADDONS_DIR = "$PTR_DIR\Interface\AddOns"
    New-Item -ItemType SymbolicLink -Path "$ADDONS_DIR\Tukui" -Target "$TUKUI_DIR" -Force
    New-Item -ItemType SymbolicLink -Path "$ADDONS_DIR\LuaUI" -Target "$LUAUI_DIR" -Force
    New-Item -ItemType SymbolicLink -Path "$ADDONS_DIR\Filger" -Target "$FILGER_DIR" -Force
}
