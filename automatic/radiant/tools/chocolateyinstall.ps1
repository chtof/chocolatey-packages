$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.radiantviewer.com/files/RadiAnt-2025.1-Setup.exe'
  checksum      = 'db503877fc27f631613366ae9f82fdf5a89b1d78dda0978714f849cb962cdacc'
  checksumType  = 'sha256'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
