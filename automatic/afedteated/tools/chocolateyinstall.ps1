$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'efc5f717c8730ef0078ce7592ea53a1c45747954662ee00599c8d99c1870f3f15ac13fef1aaa77d03d24181d3794692a18ae1caa1b215b0c14c182ed971858f4'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
