$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.29.11-win32-install.exe'
  checksum      = '35a793ff3fe6a9551ab730b886d1061ce01bac73d891147b4da534b48dc65081'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.29.11-win64-install.exe'
  checksum64    = '25cad1612a3f64d85985bce6b232ca3d936deed9d8f74fd22f7a15e634826480'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
