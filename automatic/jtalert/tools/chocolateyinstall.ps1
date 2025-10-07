$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/41ef6410c32aedbe04d705287a8c6ee6'
  checksum     = '34ad01a5a57dabc90c0ea5e0066826ac58a96e1642e54612a498b3bfb040cabd'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
