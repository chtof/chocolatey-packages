$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesGG71.1.0Setup.exe'
  checksum      = '8999969cfcdcc8b8823fd4e7eb62d265b59ac180aa4e90a0ac94ada75935ed56'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

If ( [environment]::OSVersion.Version.Major -lt 10 )  {
  Write-Warning 'Windows 10 or up is required for SteelSeries GG.'
  return
}

Install-ChocolateyPackage @packageArgs
