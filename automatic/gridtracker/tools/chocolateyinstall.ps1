$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.250402.0-setup.exe'
  checksum     = '9060ee181aef2709354d034539b48225f8f69c6eb301a7fabd217cb5146ebb3e'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
