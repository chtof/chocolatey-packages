$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://gitlab.com/-/project/86186390/uploads/6c7161c93f4600a286700fb06a8d3a79/Alt-C_Setup_1.0.7.exe'
  checksum     = '9BDEE97828744F724B362907C0B16D170B45F374AE173F5289C2F8307042349C'
  checksumType = 'sha256'

  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs