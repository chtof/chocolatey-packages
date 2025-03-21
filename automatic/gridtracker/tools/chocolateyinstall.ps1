$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.250318.1-setup.exe'
  checksum     = 'cf5a4bd6f4c39583ded40ff972a450e7b95c5cae94b66c9243be8fa1a03a57b0'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
