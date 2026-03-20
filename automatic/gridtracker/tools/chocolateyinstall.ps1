$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.260318.1-setup.exe'
  checksum     = 'f9813dd5d832ef7fde78b65f4a7cf2f82ed404ae92583728c9cd9a63ff451cef'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
