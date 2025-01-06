$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/b1373f709868837b49b4cfb4762ca936'
  checksum     = 'f4e29e757187ff1b1a4ef539a720e5d62b06f9f35162c8e7088a86c4dc96b507'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
