$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'd7375d48d9040670b87b7486d8f76477c3e97d7cfe02daeb04f64703a19fbfa7abd447b06e3f1eb6366aec83086f996bbbbd31cd218c8654d02bc4dbe473aaff'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
