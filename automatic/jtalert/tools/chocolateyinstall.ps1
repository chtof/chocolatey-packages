$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/b900c6d33946e669076aa75dd622e4f8'
  checksum     = '2dba38bab3f27c62de2318780b8100254c54ed4cd12e101a77c566188733a177'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
