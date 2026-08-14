$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'f7c479246be9d198c9fe3d56d837691d0410a6406c0e2170dd345b4dd43ded23a358d604c7c50b660db162e5085209837aa21d5c6f397ffddd0449456e109389'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
