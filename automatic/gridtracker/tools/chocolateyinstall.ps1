$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.260416.1-setup.exe'
  checksum     = '7f2b560844d18b7c1e0ecd06c51f5b25195bdf2e3baa48cf2165b074d481551b'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
