$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/710344255ce97cb6c742d12e253c18a9'
  checksum     = '61af1351f27d5360c160670c3ad68789b725fcc1bf63a8f9cef7946a6a1dae87'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
