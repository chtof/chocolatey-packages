$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.30.2-win32-install.exe'
  checksum      = '9fe5b4f159336ad71958cde54933709940c70d8ec6cdcfa8d606f49960b7a089'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.30.2-win64-install.exe'
  checksum64    = '90371e9646c262d23bad4d279387ff3298117cb6ecd7aca111092cf122fe9411'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
