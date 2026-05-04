$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/a1d83f67e408794e2bcacf625e2d4ee2'
  checksum     = '9ae68058e67d1216e58d3e9efd35e7ab0840646ebe3dac883edee2429d253349'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
