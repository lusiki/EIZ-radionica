# Publish only the checked static build, never the repository or personal files.
$ErrorActionPreference = 'Stop'
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
Set-Location $repoRoot
if (-not (Test-Path '_site/index.html')) { throw 'Run scripts/build.ps1 first.' }
$target = [IO.Path]::GetFullPath((Join-Path $repoRoot 'docs'))
New-Item -ItemType Directory -Force $target | Out-Null
if ((Resolve-Path -LiteralPath $target).Path -ne (Join-Path $repoRoot 'docs')) { throw 'Unexpected publishing directory.' }
foreach ($old in (Get-ChildItem -LiteralPath $target -Recurse -File)) {
  $relative = $old.FullName.Substring($target.Length + 1)
  if (-not (Test-Path -LiteralPath (Join-Path $repoRoot "_site/$relative") -PathType Leaf)) {
    Remove-Item -LiteralPath $old.FullName -Force
  }
}
Copy-Item '_site/*' $target -Recurse -Force
Write-Output 'Checked site copied to docs/. Commit it with the source changes to deploy from main.'
