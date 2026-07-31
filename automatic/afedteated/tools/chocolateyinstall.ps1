$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '160137fb8148bd9c8b1653db8a2dc6d870e6c1775340bf35f792d717075f66d3e1910f3551eba10bbd164afc14db60b8c56941c9284774a9088d05cec7fbaa84'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
