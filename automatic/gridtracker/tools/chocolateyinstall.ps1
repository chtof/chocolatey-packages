$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.gridtracker.org/v1.24.0801/GridTracker-Installer.1.24.0801.exe'
  checksum     = '846c555dbee440f11bcc24d1048828f5f09e0d7c807d125ff6ad5209a66fa981'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
