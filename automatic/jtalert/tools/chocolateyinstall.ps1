$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/cf6c8e851191801f7f2edf0c5b769ac5'
  checksum     = 'b743cf81407fbfaf1671e09738deee061c015af14aea951f1e227317d99a1edc'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
