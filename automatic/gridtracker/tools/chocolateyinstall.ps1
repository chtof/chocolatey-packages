$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.260511.0-setup.exe'
  checksum     = 'c4df7c0ab00ced04f7d8c3c8dac7efbf76b34136746da8db0183cbd38cb0d832'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
