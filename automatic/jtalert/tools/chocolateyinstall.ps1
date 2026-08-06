$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/c4273098185c823c6bbada3710864193'
  checksum     = 'cdde08ff5fd514e0c0b0394c5e70d0e145404b9b41f3df82f963edbc056000be'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
