$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.30.8-win32-install.exe'
  checksum      = 'bfdf4ca9026a23057493300ca37e57620ddc8ea21944cc6673f7a07166953e14'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.30.8-win64-install.exe'
  checksum64    = '7a2ea9e52c0a0f9d7a28884693597b4bccd979ec497a73b322eb135e8e83acdb'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
