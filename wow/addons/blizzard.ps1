# https://www.undocumented-features.com/2022/03/03/creating-a-symlink-on-windows-11/

# enable script run
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

$WOW_DIR = "C:\Blizzard\World of Warcraft"
$GITHUB_DIR = "C:\Users\$env:USERNAME\Documents\github"

# --- Root directory checks ---
if (-not (Test-Path $WOW_DIR)) {
    Write-Host "ERROR: World of Warcraft directory not found: $WOW_DIR" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $GITHUB_DIR)) {
    Write-Host "ERROR: GitHub directory not found: $GITHUB_DIR" -ForegroundColor Red
    exit 1
}

# --- Addon definitions ---
$Addons = @{
    "Tainted"      = "$GITHUB_DIR\Tainted"
    "Filger"       = "$GITHUB_DIR\Filger"
    # "Tukui\retail" = "$GITHUB_DIR\Tukui\Tukui"
    # "LuaUI"        = "$GITHUB_DIR\LuaUI"
    "SpellScribe"  = "$GITHUB_DIR\SpellScribe"
}

$ClassicEraAddons = $Addons.Clone()
$ClassicEraAddons.Remove("SpellScribe")

$ClassicAddons = $Addons.Clone()
# $ClassicAddons["Tainted"] = "$GITHUB_DIR\Tainted_Classic"

# --- Function to create links ---
function Link-Addons {
    param (
        [string]$TargetDir,
        [hashtable]$AddonMap
    )

    if (-not (Test-Path $TargetDir)) {
        Write-Host "ERROR: WoW directory not found: $TargetDir" -ForegroundColor Red
        return
    }

    $addonsPath = "$TargetDir\Interface\AddOns"
    if (-not (Test-Path $addonsPath)) {
        New-Item -Path $addonsPath -ItemType Directory -Force | Out-Null
        Write-Host "WARN: Created AddOns directory: $addonsPath" -ForegroundColor Yellow
    }

    foreach ($name in $AddonMap.Keys) {
        $target = $AddonMap[$name]
        if (-not (Test-Path $target)) {
            Write-Host "ERROR: Skipped missing source: $target" -ForegroundColor Red
            continue
        }

        $linkPath = Join-Path $addonsPath $name
        try {
            New-Item -ItemType SymbolicLink -Path $linkPath -Target $target -Force -ErrorAction Stop
            Write-Host "Linked: $linkPath -> $target" -ForegroundColor Cyan
        } catch {
            Write-Host "ERROR: Failed to link: $linkPath -> $target" -ForegroundColor Red
        }
    }
}

# Execute for each WoW version
Link-Addons "$WOW_DIR\_retail_" $Addons
Link-Addons "$WOW_DIR\_xptr_" $Addons # patch 11.2.0
Link-Addons "$WOW_DIR\_classic_era_" $ClassicEraAddons  # Vanilla Classic
Link-Addons "$WOW_DIR\_classic_" $ClassicAddons         # Cataclysm Classic
Link-Addons "$WOW_DIR\_classic_ptr_" $ClassicAddons     # MoP Classic

# Optional:
# Link-Addons "$WOW_DIR\_ptr_" $Addons
# Link-Addons "$WOW_DIR\_xptr_" $Addons
# Link-Addons "$WOW_DIR\_classic_" $ClassicAddons
# Link-Addons "$WOW_DIR\_classic_ptr_" $Addons
