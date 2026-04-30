$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.genymotion.com/releases/genymotion-3.10.0/genymotion-3.10.0.exe'
  checksum     = '@{Algorithm=SHA256; Hash=A8505F39B29CC56E3FC332C52DFB0FF6AC6E821719E31BC89C98DEC7C1ABBD16; Path=C:\Users\appveyor\AppData\Local\Temp\1\genymotion.exe}'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
