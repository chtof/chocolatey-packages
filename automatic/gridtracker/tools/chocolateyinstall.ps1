$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.260411.2-setup.exe'
  checksum     = '4e9e2b5258f428554c600a6db49f852011c56a4c6248810d000cd204a5a45705'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
