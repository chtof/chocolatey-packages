$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.30.7-win32-install.exe'
  checksum      = 'd447c400d5983964ddfd02c3370b2dab2f1c8c255c117562a31c76d86c127c57'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.30.7-win64-install.exe'
  checksum64    = '56e8970057bf2a5df7761df9be42af44c94e7ee8035f75dfc1c18733d86cc371'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
