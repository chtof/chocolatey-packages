$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'f299695173142869d9ad35983a284308e43fad5af54af94f76e985a1ef829add6ac2b7908643cb7bd5d5a273f33530e9f17f34dab1c8182da390a2cbfbfa25c2'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
