$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.30.6-win32-install.exe'
  checksum      = 'eda0de36440abf05bf758d6fdddb719f901da91aca1ea626764593121a3c5002'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.30.6-win64-install.exe'
  checksum64    = 'd2afd2ae7ee805e3f04d66a03a9f1a7fd7e1f92643fdd3c4f3d204c2eb5c0909'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
