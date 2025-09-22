$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.250914.1-setup.exe'
  checksum     = 'c562d178097067e49468cb550003fda67b5241e7da7248ecf00b857aa8d5b83d'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
