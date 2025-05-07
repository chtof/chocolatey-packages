$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.250504.1-setup.exe'
  checksum     = 'ef874a75b3e2936523e63ef836579eb75f659872eb953c015e7fa824258294cf'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
