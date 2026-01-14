$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/6475199f1d7446a6647bfe7d770bc3dc'
  checksum     = 'f143cb089233a6f2873416c21fd08788618c251a5928d90e97853ee7f7fb499f'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
