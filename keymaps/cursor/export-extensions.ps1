# Export installed Cursor extensions to a text file, one id per line.
# With versions: publisher.name@version
#
# Usage:
#   .\keymaps\cursor\export-extensions.ps1
#   .\keymaps\cursor\export-extensions.ps1 -OutputPath C:\path\to\extensions.txt
#
# Reinstall on another machine:
#   Get-Content .\keymaps\cursor\extensions.txt | ForEach-Object { cursor --install-extension $_ }

param(
    [string]$OutputPath
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
if (-not $OutputPath) {
    $OutputPath = Join-Path $scriptDir "extensions.txt"
}

$cursorBin = Find-Cursor
if (-not $cursorBin) {
    Write-Error "Cursor CLI was not found. In Cursor, run `"Shell Command: Install 'cursor' command in PATH`"."
    exit 1
}

$outputDir = Split-Path -Parent $OutputPath
if ($outputDir -and -not (Test-Path -LiteralPath $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir | Out-Null
}

$extensions = & $cursorBin --list-extensions --show-versions
if ($LASTEXITCODE -ne 0) {
    Write-Error "cursor --list-extensions failed with exit code $LASTEXITCODE."
    exit $LASTEXITCODE
}

$sorted = @($extensions | Where-Object { $_ -and $_.Trim() -ne "" } | Sort-Object)
$sorted | Set-Content -LiteralPath $OutputPath -Encoding ascii
Write-Host "Exported $($sorted.Count) extensions to $OutputPath"
