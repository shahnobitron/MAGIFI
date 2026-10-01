param(
  [string]$Godot = "godot"
)

$ErrorActionPreference = "Stop"
$Project = Split-Path -Parent $PSScriptRoot
$Deploy = Join-Path $Project "WEB_DEPLOY"
$Game = Join-Path $Deploy "game"

New-Item -ItemType Directory -Force -Path $Game | Out-Null

Write-Host "MAGIFI // WEB BUILD" -ForegroundColor Magenta
& $Godot --path $Project --headless --export-release "MAGIFI Web" (Join-Path $Game "MAGIFI.html")

if ($LASTEXITCODE -ne 0) {
  throw "Godot web export failed. Make sure Web export templates are installed."
}

Write-Host "Web build ready in WEB_DEPLOY/game" -ForegroundColor Green
