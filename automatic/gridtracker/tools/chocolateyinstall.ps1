$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.gridtracker.org/v1.24.0504/GridTracker-Installer.1.24.0504.exe'
  checksum     = '125e322756b92d72537a64173414aefa5603627a844b8c23b5af9f89c38f88b9'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
