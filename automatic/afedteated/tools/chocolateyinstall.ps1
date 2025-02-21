$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'd88f347c7a619de645b906a1b556f6b0bbf170030049cb787a83ceb9f24aa7fe0e9b3991c212b162ff445c96bdbf9cb7a306b6fa2d4039639db305eaec6afb16'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
