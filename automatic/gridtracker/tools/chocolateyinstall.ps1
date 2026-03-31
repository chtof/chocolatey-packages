$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.260330.2-setup.exe'
  checksum     = '094669bf6b0bf86dae9b01042bb8a34815921e161bfc452619f4478fb58f56c1'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
