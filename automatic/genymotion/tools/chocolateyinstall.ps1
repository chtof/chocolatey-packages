$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.genymotion.com/releases/genymotion-3.9.0/genymotion-3.9.0.exe'
  checksum     = '@{Algorithm=SHA256; Hash=C1E21B7A353EAE01AAF5495D2281D9C15FD3AD91DC404984675A6826BF7A0E96; Path=C:\Users\appveyor\AppData\Local\Temp\1\genymotion.exe}'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
