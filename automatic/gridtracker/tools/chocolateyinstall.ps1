$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.260315.0-setup.exe'
  checksum     = '887586b1196d0397fa9d817db54dc693435db43af8e84bf8f0b6a6ae4c0762fb'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
