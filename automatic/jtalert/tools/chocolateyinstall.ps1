$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/b9baffd8343c263fc3b18b00b2e5abf0'
  checksum     = '6931866116ce3d27a8b94269a23250096fbbfe3f00f8cc7f47ef344d614af97c'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
