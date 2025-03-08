$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.genymotion.com/releases/genymotion-3.8.0/genymotion-3.8.0.exe'
  checksum     = '@{Algorithm=SHA256; Hash=1D50B5D5916F071CBB2205C9E4E164B83B37F249AD90B8D2AA3A984989331BF5; Path=C:\Users\appveyor\AppData\Local\Temp\1\genymotion.exe}'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
