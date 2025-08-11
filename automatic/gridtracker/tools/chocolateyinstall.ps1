$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.250809.0-setup.exe'
  checksum     = '40c18a640d472012dccbfc5a685fc57fc4c04fffb1bb3c4614cbd7d70d436505'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
