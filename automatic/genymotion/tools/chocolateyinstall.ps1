$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.genymotion.com/releases/genymotion-3.7.1/genymotion-3.7.1.exe'
  checksum     = '@{Algorithm=SHA256; Hash=C6A37AB7452D021B7589288602C2D171024D47C648BD3D9A55E105720CFCEBDC; Path=C:\Users\appveyor\AppData\Local\Temp\1\genymotion.exe}'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
