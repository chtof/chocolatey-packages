$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.250507.0-setup.exe'
  checksum     = '5119f38e99689941a046716cfec8c9603e74ea5ab139f2633fbf2f5fe396f4d0'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
