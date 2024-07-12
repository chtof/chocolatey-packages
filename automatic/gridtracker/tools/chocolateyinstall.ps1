$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.gridtracker.org/v1.24.0711/GridTracker-Installer.1.24.0711.exe'
  checksum     = 'f8dfa7d86f4409f19d57a20805ad342e61d8f7ed59a144ddf4eeae3a31ff76e7'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
