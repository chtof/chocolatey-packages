$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.radiantviewer.com/files/RadiAnt-2024.2-Setup.exe'
  checksum      = '43b81c4a6d16e7ef1d789663a567e0adfa12b1878776b45623eb235e16a6f15f'
  checksumType  = 'sha256'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
