$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/0b367441001d2e12df504007aac6f9fb'
  checksum     = '2d9dfdbf8c58ecdbb464476161b87b05253cb6be8521461b861e8800d8481765'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
