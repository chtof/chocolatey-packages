$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.gridtracker.org/v1.24.0922/GridTracker-Installer.1.24.0922.exe'
  checksum     = 'cb94308107524f4d8de923d9d4b716e2b8e93bcad08cd5cb6099c5054ecdde14'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
