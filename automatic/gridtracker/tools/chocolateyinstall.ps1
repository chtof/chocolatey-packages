$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.261011.2-setup.exe'
  checksum     = 'c08021151690851eefc359183572c591f9d71acc0f18feb223f12effb9b7dc89'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
