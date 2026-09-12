$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.260909.0-setup.exe'
  checksum     = 'ce8289d687ffb32c39ad327448a2af833f3e0d4e864dfd293bbe7bce7859be0f'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
