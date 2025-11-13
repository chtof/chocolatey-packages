$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.30.5-win32-install.exe'
  checksum      = 'c831b15de292139c4344f3a320861ddb3795657fe9b32b86c2ddb79d0c24e134'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.30.5-win64-install.exe'
  checksum64    = 'a75bd5b4d2f161c17cb3dae7dfe5d52e16f9d32b3528a17474dbc53f96d50687'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
