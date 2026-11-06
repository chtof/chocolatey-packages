$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.30.13-win32-install.exe'
  checksum      = '6cf4dfd7fe2a5601bf8be2221403e23f5cbf47deef8b8287abb243a0fe789858'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.30.13-win64-install.exe'
  checksum64    = '3cc689de2981751e2e8ea9e1c8e0db23cece6b45bf85df7ca7ba3873a71ea154'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
