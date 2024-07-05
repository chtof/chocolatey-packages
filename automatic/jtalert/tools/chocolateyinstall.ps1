$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/4a12e426b7baa58abed3c67ccd4944ed'
  checksum     = 'eb002793e1299c0e2794d6c19d63ba8bb0d6d9e234d0c1cb6677a78915c88b0b'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
