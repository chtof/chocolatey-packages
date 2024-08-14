$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.gridtracker.org/v1.24.0814/GridTracker-Installer.1.24.0814.exe'
  checksum     = '2c6dba4644e7e5133f297cc71bdd815bf8f2bbc16c931cd6540734560040f020'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
