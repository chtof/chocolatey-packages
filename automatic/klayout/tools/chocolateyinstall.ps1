$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.29.2-win32-install.exe'
  checksum      = '9479b687331a3e1b4926941b31fc6366b26a1e65e6000f308bbba28d3db95da6'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.29.2-win64-install.exe'
  checksum64    = '5424eb44bf85d2b768d0e1b21b47553a2a5c65a43e9d80e91f5baea65e3b0ae3'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
