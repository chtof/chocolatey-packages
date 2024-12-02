$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.29.9-win32-install.exe'
  checksum      = '1f94b5dc439961e5a73400caef84ea157356437cbed173534d73f3220945ae6b'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.29.9-win64-install.exe'
  checksum64    = '4eca9f3781bc51f80daec6f3c68f597f41f9d0591eed07025e1653eb31dd142b'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
