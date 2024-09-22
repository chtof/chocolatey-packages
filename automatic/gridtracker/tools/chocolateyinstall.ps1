$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.gridtracker.org/v1.24.0920/GridTracker-Installer.1.24.0920.exe'
  checksum     = '4422795b9a1fe6a7e53e43974bef2036a12131e4468d5a67cd21b514452aaa7f'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
