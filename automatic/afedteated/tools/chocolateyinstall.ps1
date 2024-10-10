$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '714f929f556df3d6ba86ab180d83091fcc0044932ce3c434581569d65a23ea387859cb962a8b50748a2c8753ed4c83f9448e48625329772d1758214e1b93564b'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
