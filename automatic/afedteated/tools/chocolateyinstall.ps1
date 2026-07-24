$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '1d3717f13d35f36c0a96243b0c576dddf706c5fc44057605b82ec98247acb35bce040abd7ebb73f891d23200bc679f3245736dda0ea830ed651cb10c12a18b7f'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
