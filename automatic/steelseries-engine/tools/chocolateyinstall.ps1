$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesGG70.0.0Setup.exe'
  checksum      = 'c104f598c12c27ca2265cc9507f6cfd9e3c10ddbedf29b7c04d70638475c1866'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

If ( [environment]::OSVersion.Version.Major -lt 10 )  {
  Write-Warning 'Windows 10 or up is required for SteelSeries GG.'
  return
}

Install-ChocolateyPackage @packageArgs
