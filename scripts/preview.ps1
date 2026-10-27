param([int]$Port = 4317)
$ErrorActionPreference = 'Stop'
Set-Location (Split-Path $PSScriptRoot -Parent)
if (-not (Test-Path 'work/preview.json')) { & (Join-Path $PSScriptRoot 'build.ps1') }
$preview = Get-Content work/preview.json -Raw | ConvertFrom-Json
if (-not (Test-Path -LiteralPath $preview.buildRoot)) {
  & (Join-Path $PSScriptRoot 'build.ps1')
  $preview = Get-Content work/preview.json -Raw | ConvertFrom-Json
}
Write-Output "Local preview: http://127.0.0.1:$Port (Ctrl+C to stop). No publication."
quarto preview $preview.buildRoot --no-browser --no-watch-inputs --host 127.0.0.1 --port $Port
