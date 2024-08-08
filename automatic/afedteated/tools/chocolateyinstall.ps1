$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'a0832a346b29ff200f57cf76570ea98491745b5173ae16d1759c8bdd7803326222bf7f41259ed8c80c59bbed39dc51635e5ea336983af871debde87a4fc6daac'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
