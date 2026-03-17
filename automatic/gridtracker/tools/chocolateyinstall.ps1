$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.260315.2-setup.exe'
  checksum     = '3c15480fbaa66eab93cde564036a167a2db999892b2ccebf6c1b9b2c3d0ff9b8'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
