$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/4d040bd0a53ddba77017be8c7886948d'
  checksum     = 'eadf809cf5a56f30f261693c2c5e29fd7caf550d06125732d89f1342a270c7f1'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
