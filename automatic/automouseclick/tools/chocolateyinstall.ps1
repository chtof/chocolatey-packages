$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.murgee.com/auto-mouse-click/download/setup.exe'
  checksum     = 'F3A2A16156978818496E9D7C0125113530D8421B594156DEDE5452C59A280E9D'
  checksumType = 'sha256'

  silentArgs   = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
