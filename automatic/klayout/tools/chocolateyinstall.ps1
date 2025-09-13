$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.30.4-win32-install.exe'
  checksum      = '78bcd602633641b97e4739c31452700e7947e42ea6162db2c01bd5566c4ad598'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.30.4-win64-install.exe'
  checksum64    = '615c13885d23b5f72a53d85e46d41187a0ed84862081796b8e9672bc52a88ff3'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
