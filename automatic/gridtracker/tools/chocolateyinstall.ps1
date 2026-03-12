$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.260307.0-setup.exe'
  checksum     = '85d89b136a520a3854085de0c4cc6e765f76f570f3b7ea4c630f2531643f41f1'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
