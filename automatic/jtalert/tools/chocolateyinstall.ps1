$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/92e0552d87593aada14d61431e7f727a'
  checksum     = '73137ea8e2deae4261bf07db4d667ddb14cd8baa04142e843a9103faffe9096b'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
