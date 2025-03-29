$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/2bec9e2789d3807acb04115e3a021028'
  checksum     = 'bbde1a58651e1a3b851efee43b2aafb854a56bb148d14023cf3f4cfefac82560'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
