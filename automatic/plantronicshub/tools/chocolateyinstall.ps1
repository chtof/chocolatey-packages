$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.poly.com/headsets/PlantronicsHubInstaller.exe'
  checksum     = 'e43484d770f3da729d8ba090604ad971a3db201ec7dfa80ad21cfe3cd3b38a52'
  checksumType = 'sha256'

  silentArgs   = '/install /quiet /norestart'
}

Install-ChocolateyPackage @packageArgs
