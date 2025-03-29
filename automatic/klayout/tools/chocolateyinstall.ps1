$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.30.0-win32-install.exe'
  checksum      = 'cb946ed4748e88ec1dcec26c0ada8e545c8fd2691c50aca44164d514f766d619'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.30.0-win64-install.exe'
  checksum64    = 'ec502a2740f463137e606c8c667e6c6bdb8a04ffbd5d583738ce5e8427a9dffa'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
