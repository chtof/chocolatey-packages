$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.radiantviewer.com/files/RadiAnt-2025.2-Setup.exe'
  checksum      = '40fa561cd6678ac941692dda02452fbbe7df4b04f4d54d12f1d6e2c8b672d024'
  checksumType  = 'sha256'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
