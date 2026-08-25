$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.30.11-win32-install.exe'
  checksum      = 'aa926b5d08eb8785fd4394d7c6e32bdb1baa02173f33bbfb03293a95b7cee073'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.30.11-win64-install.exe'
  checksum64    = '9d3555ece96a871f1c34522d0609fc648a71d922234dbbe588541f298636ff88'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
