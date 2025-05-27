$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://rx4hx.qrz.ru/files/loghx/LogHX3Setup_build_778.exe'
  checksum      = 'f8d22bd40d38c6bfda7089568ea1b068b85b6ad3eaaeffb4ba6e8de9ae21f5b7'
  checksumType  = 'sha256'

  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
