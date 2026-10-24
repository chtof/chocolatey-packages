$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/5a237412805ea83188494430ce9e0e35'
  checksum     = 'f625ee796e51bb6d5faeeb811ef538f5fa443643c7c4b9b4a89b9be6529e3a37'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
