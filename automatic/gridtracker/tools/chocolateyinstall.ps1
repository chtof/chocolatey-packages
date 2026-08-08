$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.260807.1-setup.exe'
  checksum     = '9106ebb10c047d7b936ff29164833b0f009b504e902dbfa8719bd1ea5ce32435'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
