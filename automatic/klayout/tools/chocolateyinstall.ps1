$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.30.3-win32-install.exe'
  checksum      = 'a5aaafaec96da45a8f8893dec9599678d59b0f978a966d430a3439259e279b26'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.30.3-win64-install.exe'
  checksum64    = '8a594070bab403223e2c23daf25a6af062a21b2d5033e41636f8f2dcb685f209'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
