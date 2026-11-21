$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.261117.7-setup.exe'
  checksum     = 'fc4e05660e0a05fbecf2116007d0e103dbe74bd45a5002d8f55623ace43cb261'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
