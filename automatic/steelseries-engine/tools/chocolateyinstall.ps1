$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesGG98.0.0Setup.exe'
  checksum      = 'fddd98d97f61965be7522a057c5a4801895bbeb67a432e59fa73dca2233af9ae'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

If ( [environment]::OSVersion.Version.Major -lt 10 )  {
  Write-Warning 'Windows 10 or up is required for SteelSeries GG.'
  return
}

Install-ChocolateyPackage @packageArgs
