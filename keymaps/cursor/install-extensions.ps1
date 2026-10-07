# Install Cursor extensions listed in extensions.txt.
# Each line is publisher.name or publisher.name@version.
#
# Usage:
#   .\keymaps\cursor\install-extensions.ps1
#   .\keymaps\cursor\install-extensions.ps1 -ListPath C:\path\to\extensions.txt

param(
    [string]$ListPath
)

$ErrorActionPreference = "Stop"
if (Get-Variable -Name PSNativeCommandUseErrorActionPreference -ErrorAction SilentlyContinue) {
    $PSNativeCommandUseErrorActionPreference = $false
}

function Find-Cursor {
    $onPath = Get-Command cursor -ErrorAction SilentlyContinue
    if ($onPath) {
        return $onPath.Source
    }

    $winCmd = Join-Path $env:LOCALAPPDATA "Programs\cursor\resources\app\bin\cursor.cmd"
    if (Test-Path -LiteralPath $winCmd) {
        return $winCmd
    }

    $macApp = "/Applications/Cursor.app/Contents/Resources/app/bin/cursor"
    if (Test-Path -LiteralPath $macApp) {
        return $macApp
    }

    return $null
}

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
if (-not $ListPath) {
    $ListPath = Join-Path $scriptDir "extensions.txt"
}

$cursorBin = Find-Cursor
if (-not $cursorBin) {
    Write-Error "Cursor CLI was not found. In Cursor, run `"Shell Command: Install 'cursor' command in PATH`"."
    exit 1
}

if (-not (Test-Path -LiteralPath $ListPath)) {
    Write-Error "Extension list not found: $ListPath"
    exit 1
}

$installed = 0
$failed = 0

Get-Content -LiteralPath $ListPath | ForEach-Object {
    $extension = ($_ -replace "#.*", "" -replace "\s", "")
    if (-not $extension) {
        return
    }

    Write-Host "Installing $extension"
    & $cursorBin --install-extension $extension
    if ($LASTEXITCODE -eq 0) {
        $script:installed++
    }
    else {
        Write-Warning "Failed to install $extension"
        $script:failed++
    }
}

Write-Host "Installed $installed extensions. Failed: $failed."
if ($failed -ne 0) {
    exit 1
}
