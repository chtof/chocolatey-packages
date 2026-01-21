$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesGG103.0.0Setup.exe'
  checksum      = '13594f8575763d1198ac48d17149fdfb3249732b62fbff098b040cd2c4bf47cf'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

If ( [environment]::OSVersion.Version.Major -lt 10 )  {
  Write-Warning 'Windows 10 or up is required for SteelSeries GG.'
  return
}

Install-ChocolateyPackage @packageArgs
