$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.29.4-win32-install.exe'
  checksum      = '28b26f75f6195dcf1ca1f1b5352bdd5d0a8cb124386f4894c543e8778e5198cc'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.29.4-win64-install.exe'
  checksum64    = '1f3b5b862c74f8d2efd44a718f5cb4b0c4aeb7c6e1551812cf69a0b09d796097'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
