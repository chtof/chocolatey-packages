$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.260421.1-setup.exe'
  checksum     = '41ea3d888e8455c3de2c388c8f29b7a2a7d561c9787936dfd8a24904fe235e60'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
