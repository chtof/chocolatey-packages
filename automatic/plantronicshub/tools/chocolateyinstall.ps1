$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.poly.com/headsets/PlantronicsHubInstaller.exe'
  checksum     = 'e386741608604faea8ebb51c8c6bcdbf5493ff006968f0234751745e5ec5cd4c'
  checksumType = 'sha256'

  silentArgs   = '/install /quiet /norestart'
}

Install-ChocolateyPackage @packageArgs
