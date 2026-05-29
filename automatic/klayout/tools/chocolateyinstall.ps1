$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.30.9-win32-install.exe'
  checksum      = '0ed7319ec78ade52030fcbe8e63c49320eb646c31a80ed0df45ef68f1074dd86'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.30.9-win64-install.exe'
  checksum64    = 'bcfa5dc9ff89f52f01f0598bccd33f1240b03b3f94d26dc4e04eb30d57e4a8b1'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
