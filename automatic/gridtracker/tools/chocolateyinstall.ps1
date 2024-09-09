$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.gridtracker.org/v1.24.0908/GridTracker-Installer.1.24.0908.exe'
  checksum     = '5fab2d11586ee8b785d948db7fcd6f565f6683a36954deefbb1ca8eba4242a55'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
