$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/295bbf3bca1fe42cb8c0dd66486e5ac2'
  checksum     = '389685ac33cc77d5fb5fa0aba118bdb324c029c8b4e98d075c1bafd838b5e69c'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
