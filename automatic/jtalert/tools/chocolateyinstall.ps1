$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/079d8e7ed760eed5f82bc42f25b31dab'
  checksum     = '167d3939c32fb63d83b3f99cdd52a6fced85dc1d3ff49c4314e2ae0b394cff87'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
