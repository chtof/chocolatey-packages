$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'f684dfe4208d9cac32a5cadd8866637da694c3a4911d743967b5fae804bc14143619b827e4ffcf6db35faa1013106342cc14d89b379c25fcafccd8738e0acc44'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
