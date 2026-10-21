$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.261019.5-setup.exe'
  checksum     = '5ca3ce6d33279b7ed80c1f3ff4a12bb441e651767a54bb88a0ec8106ca8044eb'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
