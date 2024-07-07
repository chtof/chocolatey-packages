$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.29.3-win32-install.exe'
  checksum      = '1d5f284088fd48d508ba378065f1ced001413b43dba0d0a677e1c42462e1338b'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.29.3-win64-install.exe'
  checksum64    = '46e3815c9f4ce0ba35da0791bd0ff7484dd96f15a332bdcb83d15c5fb017c894'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
