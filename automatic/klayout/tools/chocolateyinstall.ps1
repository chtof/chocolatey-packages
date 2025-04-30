$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.30.1-win32-install.exe'
  checksum      = 'bb4fab16f54be1486faf74b701504a70c25c32659f496f762c707234cda63045'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.30.1-win64-install.exe'
  checksum64    = 'd7046308e9b8bd8a93490a5bdd6e22e1e4c959e4da315727c44a5abe74ad6c74'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
