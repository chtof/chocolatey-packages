$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.260307.1-setup.exe'
  checksum     = 'a0b97bc1d0de69854537fff90e792e2e67e9906d32f535371958630ca43a84fd'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
