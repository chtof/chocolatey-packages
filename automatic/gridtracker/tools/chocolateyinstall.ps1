$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.260415.0-setup.exe'
  checksum     = '8d4381c0563894fe0d94dee99eac0ff8ff73ebc864082781e078bdbb6189cd64'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
