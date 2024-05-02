$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'http://www.epidata.dk/downloads/epidata-all-in-one-setup.4.7.0.exe'
  checksum     = 'cc3c239aca351c9c05dbaa5663b809d041f87ada00d02b7e43cd872e7a172dde'
  checksumType = 'sha256'

  silentArgs   = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
