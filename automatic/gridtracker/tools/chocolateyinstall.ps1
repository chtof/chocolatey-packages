$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.260925.2-setup.exe'
  checksum     = 'f2bc71fc6c79c5da45eea70c15124bdd59254a9e419ff58ff73607f8d141cb92'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
