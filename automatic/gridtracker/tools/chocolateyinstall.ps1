$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.260413.3-setup.exe'
  checksum     = 'c2654b64b025190138fd4157b1a1c6a502ab014f54647dd72976a1b31c6fe658'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
