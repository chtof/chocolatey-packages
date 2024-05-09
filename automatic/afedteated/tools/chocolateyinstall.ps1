$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '20359740cce649944601b10931723d6e9ba98b148a4b426aca52d296b6014655b07009a083dade2738f12e5d009d343b2dad86f9ee2f5047d9d17b58e7223b9c'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
