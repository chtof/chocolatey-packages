$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.260912.0-setup.exe'
  checksum     = 'b097d7098d5b848204d4bfeb21c3546417e513293d0a7bf7efa15efbe6fb063e'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
