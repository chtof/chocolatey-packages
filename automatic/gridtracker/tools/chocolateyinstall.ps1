$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.gridtracker.org/v1.24.0811/GridTracker-Installer.1.24.0811.exe'
  checksum     = 'f64f54b2150cf9088ae7c30e279e1b3852da1f464198c6f66e106646e0a90ca3'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
