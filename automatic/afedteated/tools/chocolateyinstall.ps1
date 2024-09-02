$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'bea570cfa56972bd9a24ea880efc2d0376b1a718d6652cf043c2eda89763d193e54d91a66492cf3a970cb4b34204bbc1387e9ac514630ecea527e84636ccedfa'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
