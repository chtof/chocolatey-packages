$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.250603.2-setup.exe'
  checksum     = 'cdc2272dfe7f665dccd2a1eea2bca14be1152c5b5db48f2a4bb3326717620602'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
