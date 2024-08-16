$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.29.6-win32-install.exe'
  checksum      = '22177e9316f35cf94fa0b6b21549135c78e3c5cb7d81ef53fb8af0aa140ff794'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.29.6-win64-install.exe'
  checksum64    = 'dd0de081aff01f3f34e377a2b89d5984433150843219089cdb2f84396e664793'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
