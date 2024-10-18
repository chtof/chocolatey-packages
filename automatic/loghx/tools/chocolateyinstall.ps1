$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://rx4hx.qrz.ru/files/loghx/LogHX3Setup_build_769.exe'
  checksum      = 'f6a9b86c63491bd75a864515cc3389265c598aa009ad19c84f51fca33253cfa7'
  checksumType  = 'sha256'

  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
