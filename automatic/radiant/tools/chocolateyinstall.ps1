$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.radiantviewer.com/files/RadiAnt-2026.1-Setup.exe'
  checksum      = 'bdb5c8ccc2dc72c6386998a9760121a0a295dd01b95e3e5703b8e302b61dd6dc'
  checksumType  = 'sha256'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
