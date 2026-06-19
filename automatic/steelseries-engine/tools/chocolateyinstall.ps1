$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesGG113.0.0Setup.exe'
  checksum      = '5efcbc8a90e4d3098578143b2f20726b99c19823be9b370910d8a37b89c2525e'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

If ( [environment]::OSVersion.Version.Major -lt 10 )  {
  Write-Warning 'Windows 10 or up is required for SteelSeries GG.'
  return
}

Install-ChocolateyPackage @packageArgs
