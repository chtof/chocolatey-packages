$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.250421.1-setup.exe'
  checksum     = '7f35bf972bdf1c638d8d5da0843f9ee68780112235bc7f25cc7981465927426d'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
