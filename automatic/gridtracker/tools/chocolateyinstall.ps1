$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.gridtracker.org/v1.24.0715/GridTracker-Installer.1.24.0715.exe'
  checksum     = 'd06560325c33b06a78237bb740c60bf88be1ec1f6d07e31772bb1b76bbafedc0'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
