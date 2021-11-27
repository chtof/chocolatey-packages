$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesEngine3.22.2Setup.exe'
  checksum      = 'b4e05c613b7a6d931b386db0fa680f97110b1d9f306d473e8b85e955454d9521'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
