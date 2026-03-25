$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.260323.0-setup.exe'
  checksum     = '35dc5caf4799898dfc1032bf1abbd266ecb336b6995e92c8f680b10909c0c70d'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
