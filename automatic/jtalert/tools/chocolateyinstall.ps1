$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/185ec84a6c0b97b79352950a86d30804'
  checksum     = '78307fa5eb1324156045d307be62b51541246cd95b0931d31c92187c7a1a22bf'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
