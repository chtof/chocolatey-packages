$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '136cd7f5c8daab7595ccbf058879d08854915b272016eac70354622eebd4c9fbe2d838ec8889daf4a531c67042caa208221220721fb36203751308d3e5d89cdb'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
