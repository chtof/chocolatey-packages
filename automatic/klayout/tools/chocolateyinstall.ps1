$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.30.12-win32-install.exe'
  checksum      = '6e07f0eafa310ffa2a2398d6591c88d20cd9bda7d8e958d051da852859162c2d'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.30.12-win64-install.exe'
  checksum64    = '40cc142bcf69cc3ecf74e1ec9a73d1c1cbf416f712123a303bda7d41a1b7a74d'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
