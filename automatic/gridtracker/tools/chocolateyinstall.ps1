$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.260901.1-setup.exe'
  checksum     = 'd8132921cbfb390f1130aab3fd5107c587bedddfd9c25a225401035ca9cf7de7'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
