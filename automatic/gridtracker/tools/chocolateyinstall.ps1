$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.260613.0-setup.exe'
  checksum     = '3b86ba5e162af0b7e9d1c2d51d48634f931ee57032f4351c01cc1bd9fe1f96b1'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
