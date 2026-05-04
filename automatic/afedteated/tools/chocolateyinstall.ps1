$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '614b01e2c12c853c99f6bed0539c43600ade20fd0da61af8fd7bebc5655ce8854ca404ca2c90a70d5f3bf9ceb8b5199c0cb466f901c4a1817f46fdb703fe35d8'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
