$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '9060ea4c9259f122c7ae069a3ae877700c1380cc85ea61f6b7bde2ff94663e1b2279a62cadb957675ed01eab0ce7bf49e4523d1940bf64b9deef3c855d73bc05'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
