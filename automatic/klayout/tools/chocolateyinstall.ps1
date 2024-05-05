$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.29.1-win32-install.exe'
  checksum      = '9e7de12899d84e347fef2958d8bf2663a6b4ce0d35c2c748b484642ffaacc55f'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.29.1-win64-install.exe'
  checksum64    = '8080fa0b2196fa795cb68b3b9da77a12bb190e830d0d1192994d9af38cc10ada'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
