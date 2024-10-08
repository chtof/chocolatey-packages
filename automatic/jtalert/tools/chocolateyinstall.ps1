$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/f3d6ebfd9ee1839b6d3a473319dad77c'
  checksum     = 'cca8da30fdbbcf13975f5cecc4400880829d60e4779f5c8f84558733902f76a4'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
