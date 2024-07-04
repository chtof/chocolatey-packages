$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '6f08a189f6f29b802357fec586fd8e3f2beb846b39a6fb29b242fae7bbf7e3f4b2f7c0e68814addf5a0366d09e631ba22efe09a93431cf4607917545cd6d42eb'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
