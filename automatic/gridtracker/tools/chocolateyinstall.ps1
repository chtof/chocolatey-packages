$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.gridtracker.org/v1.24.0512-2/GridTracker-Installer.1.24.0512.exe'
  checksum     = 'caf392470a42660f922f59a3643807f8dec8426158d16940a1d535e38dd86881'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
