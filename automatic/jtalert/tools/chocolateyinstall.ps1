$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/72bdc02c7dca7aeccfa30025ccd49102'
  checksum     = '7869e35ac3a3351bd2e1c462765b30e87be97e2d4dabf758b6bd60d0582ccf4e'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
