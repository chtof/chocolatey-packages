$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.genymotion.com/releases/genymotion-3.11.0/genymotion-3.11.0.exe'
  checksum     = '@{Algorithm=SHA256; Hash=BFBF61C6C809E1094A901E951F6358FC31FA3CDBC36E657096AB99B2BC9CBC81; Path=C:\Users\appveyor\AppData\Local\Temp\1\genymotion.exe}'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
