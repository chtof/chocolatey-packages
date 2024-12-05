$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.29.10-win32-install.exe'
  checksum      = '4d38d101fd413f2547fa94cee67733894405ac33e90d46e6525bfa53604ed6c2'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.29.10-win64-install.exe'
  checksum64    = '31dcdd16a1f535d7162b60ce36e066e125ba4d7b50d1c6aff8f94c8f14c9481e'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
