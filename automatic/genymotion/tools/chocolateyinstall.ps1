$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.genymotion.com/releases/genymotion-3.7.0/genymotion-3.7.0.exe'
  checksum     = '@{Algorithm=SHA256; Hash=C866E07583FCC9AC903FFFF674B50527CC73C43ED6DF086B9C80D187370F41E9; Path=C:\Users\appveyor\AppData\Local\Temp\1\genymotion.exe}'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
