$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.gridtracker.org/v1.24.0707/GridTracker-Installer.1.24.0707.exe'
  checksum     = 'd265bc525983e34f7eee0632d418d3bec53883f29134697efc77008c69cc4358'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
