$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '1bbc2bb7bff90b26a66aa84729e872e5d554274b6b285547056e4d08d5fd7f168a97ccde801d95ef6232e341cb94d4bc9a8f478957bfa82cb16c53c40ac7719d'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
