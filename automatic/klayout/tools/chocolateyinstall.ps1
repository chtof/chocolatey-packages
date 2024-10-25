$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.29.8-win32-install.exe'
  checksum      = 'fa204d5a2d8331a62497486137a9f47c0d92a0be21b5a13cd6e2010cbbf6062a'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.29.8-win64-install.exe'
  checksum64    = 'baf056b0782077cb895e08ad0371225ceb304005823c7f12b3a31aa327a59d91'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
