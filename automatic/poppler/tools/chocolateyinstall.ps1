$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file64      = "$toolsDir\Release-26.02.0-0.zip"  
}
Get-ChocolateyUnzip @packageArgs

Remove-Item $packageArgs.file64

# The release zip bundles helper tools that are not part of Poppler (e.g. zstd.exe);
# suppress their shims so they cannot collide with dedicated packages.
Get-ChildItem $toolsDir -Recurse -Filter 'zstd.exe' | ForEach-Object {
  New-Item "$($_.FullName).ignore" -ItemType File -Force | Out-Null
}