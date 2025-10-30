$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'b0a34406af372123f2a196e34c70917359c81141443298a492bc57261fdf0d7357bb6dbfb537087697b941a5b85d96e79827aa63640ce3b9434905b96e1a3bcf'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
