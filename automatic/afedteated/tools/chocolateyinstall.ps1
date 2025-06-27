$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '85dc50156e3959e02ae4323e9bfac64453f224838e30d0e392fdbabe7807fec9393f81878ca3fbc522bd7d81d81ec5ae9817b223c35a82724ec9cf37c68dd695'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
