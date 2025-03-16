$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '8f22f74485dee18eb717260c5dc610c21dda4d08da67f355b2dd9769bf481f32e9221675b55cb2cc206560593d6c1e0ef458a1eeec71d915d547349cf82381f2'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
