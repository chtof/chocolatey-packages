$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.29.12-win32-install.exe'
  checksum      = 'f5d09b8382f3a1f7836cc4d279b906cbc6b3952237c44181894b3aebc8605c47'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.29.12-win64-install.exe'
  checksum64    = '8f438972a83adb5c42bd031b1ee4e5b4636871e6363d26f7785951a8615fc20b'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
