# Explicit allowlist: no personal settings, old exports, libraries or submissions.
$ErrorActionPreference = 'Stop'
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
Set-Location $repoRoot
$staging = Join-Path $repoRoot ('work/package-' + [Guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $staging -Force | Out-Null
$rootFiles = @('README.md','WORKSHOP_SPEC.md','DESIGN.md','LICENSE-NOTICE.md',
  'DESCRIPTION','_quarto.yml','_variables.yml','.Rprofile','renv.lock','design-tokens.yml','index.qmd')
$files = @($rootFiles | ForEach-Object { Join-Path $repoRoot $_ })
foreach ($folder in @('code','data','materials','styles','scripts','design','outlines','booklet')) {
  $files += Get-ChildItem (Join-Path $repoRoot $folder) -Recurse -File |
    Where-Object { $_.Extension -in @('.R','.qmd','.md','.json','.csv','.svg','.scss','.css','.theme','.ttf','.txt','.ps1','.py') } |
    Select-Object -ExpandProperty FullName
}
$files += Get-ChildItem (Join-Path $repoRoot 'admin') -File |
  Where-Object { $_.Extension -in @('.qmd','.md') -and $_.Name -notlike '*.knit.md' } |
  Select-Object -ExpandProperty FullName
$files += @('slides/day1.qmd','slides/day2.qmd','slides/README.md',
 'renv/activate.R','renv/settings.json','results/inflation_expectations.svg',
 'results/annual_summary.csv','results/correlations.csv','results/audit.csv',
 'downloads/EIZ-prirucnik.pdf','downloads/booklet-manifest.json') |
 ForEach-Object { Join-Path $repoRoot $_ }
foreach ($source in ($files | Sort-Object -Unique)) {
  if (-not (Test-Path -LiteralPath $source -PathType Leaf)) { throw "Missing package file: $source" }
  $relative = $source.Substring($repoRoot.Length + 1)
  $dest = Join-Path $staging $relative
  New-Item -ItemType Directory -Force -Path (Split-Path $dest) | Out-Null
  Copy-Item -LiteralPath $source -Destination $dest
}
New-Item -ItemType Directory -Force (Join-Path $repoRoot 'downloads') | Out-Null
$zipPath = Join-Path $repoRoot 'downloads/eiz-workshop.zip'
# Only this known generated ZIP may be replaced; no recursive deletion.
if (Test-Path -LiteralPath $zipPath) { Remove-Item -LiteralPath $zipPath }
Add-Type -AssemblyName System.IO.Compression, System.IO.Compression.FileSystem
# .NET Framework's CreateFromDirectory can store Windows backslashes. ZIP
# entry names must use forward slashes so Linux and macOS see real folders.
$archive = [IO.Compression.ZipFile]::Open($zipPath, [IO.Compression.ZipArchiveMode]::Create)
try {
  foreach ($entryFile in (Get-ChildItem -LiteralPath $staging -Recurse -File | Sort-Object FullName)) {
    $entryName = $entryFile.FullName.Substring($staging.Length + 1).Replace('\', '/')
    [IO.Compression.ZipFileExtensions]::CreateEntryFromFile(
      $archive, $entryFile.FullName, $entryName, [IO.Compression.CompressionLevel]::Optimal
    ) | Out-Null
  }
}
finally { $archive.Dispose() }
Write-Output "Workshop package: $zipPath"
