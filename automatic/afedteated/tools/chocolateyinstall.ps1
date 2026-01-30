$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '2aa7524a1b18d7e84ce10f0e55d863f25b559b0488a113d7a2899320bc713c43db2bf093167c4c1f05f055d5bed10f7c36b0a2738ebc2f246ca82a5e99835258'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
