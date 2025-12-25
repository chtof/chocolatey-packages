$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/ec0b03459b54bed02cc85153c04baa03'
  checksum     = '1bc6429dd92ddb2d700bda4e6613044cfd4209f3b01c41a68aa0f026d646ac0e'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
