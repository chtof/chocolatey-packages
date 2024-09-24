$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.29.7-win32-install.exe'
  checksum      = 'ca6815e8fd250afe0ba01f1082a376310a0c82e81857eb534534ded23d6dcd91'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.29.7-win64-install.exe'
  checksum64    = 'cdd28952b1a7e5772e49cfa454779cae0e2a31d2d0b56a37a96f27d78fafa6bb'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
