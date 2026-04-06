$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.260405.5-setup.exe'
  checksum     = '39c8da631f6bfe969637582bf18fcd68e2256179631ad01fa8712a5161b7c775'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
