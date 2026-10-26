param([switch]$SkipAnalysis)
$ErrorActionPreference = 'Stop'
Set-Location (Split-Path $PSScriptRoot -Parent)
# Process-local: do not change the user's machine or profile settings.
$env:LC_ALL = 'English_United States.utf8'
$env:EIZ_RENV = '1'
$rCommand = Get-Command Rscript -ErrorAction SilentlyContinue
if ($rCommand) { $rExe = $rCommand.Source }
else {
  $rExe = Get-ChildItem 'C:\Program Files\R' -Filter Rscript.exe -File -Recurse |
    Where-Object { $_.FullName -notmatch 'x64' } |
    Sort-Object FullName -Descending | Select-Object -First 1 -ExpandProperty FullName
}
if (-not $rExe) { throw 'Rscript not found. Install R and restore renv as documented in README.md.' }
if (-not (Get-Command quarto -ErrorAction SilentlyContinue)) { throw 'Quarto not found.' }
if (-not $SkipAnalysis) {
  & $rExe code/run_all.R
  if ($LASTEXITCODE -ne 0) { throw 'Reference analysis failed.' }
}
& $rExe scripts/check_design.R
if ($LASTEXITCODE -ne 0) { throw 'Design token check failed.' }
& (Join-Path $PSScriptRoot 'package.ps1')
# Render a source-only copy outside Dropbox. Quarto moves intermediate HTML
# and cloud sync can lock those files; this also preserves historical exports.
$buildRoot = Join-Path ([IO.Path]::GetTempPath()) ('eiz-workshop/work/build-' + [Guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Force $buildRoot | Out-Null
Add-Type -AssemblyName System.IO.Compression.FileSystem
[IO.Compression.ZipFile]::ExtractToDirectory((Join-Path (Get-Location) 'downloads/eiz-workshop.zip'), $buildRoot)
New-Item -ItemType Directory -Force (Join-Path $buildRoot 'downloads') | Out-Null
Copy-Item downloads/eiz-workshop.zip (Join-Path $buildRoot 'downloads/eiz-workshop.zip')
quarto render $buildRoot
if ($LASTEXITCODE -ne 0) { throw 'Quarto render failed.' }
New-Item -ItemType Directory -Force _site,work | Out-Null
# Remove obsolete generated files only; never touch source or historical exports.
$sitePath = (Resolve-Path '_site').Path
$expectedSitePath = [IO.Path]::GetFullPath((Join-Path (Get-Location) '_site'))
if ($sitePath -ne $expectedSitePath) { throw 'Unexpected preview path.' }
foreach ($oldFile in (Get-ChildItem -LiteralPath $sitePath -Recurse -File)) {
  $relative = $oldFile.FullName.Substring($sitePath.Length + 1)
  if (-not (Test-Path -LiteralPath (Join-Path $buildRoot "_site/$relative") -PathType Leaf)) {
    Remove-Item -LiteralPath $oldFile.FullName -Force
  }
}
Copy-Item (Join-Path $buildRoot '_site/*') _site -Recurse -Force
@{buildRoot=$buildRoot; siteRoot=(Join-Path $buildRoot '_site')} | ConvertTo-Json |
  Set-Content work/preview.json -Encoding UTF8
Write-Output 'Local build ready: _site/index.html. Nothing has been published.'
