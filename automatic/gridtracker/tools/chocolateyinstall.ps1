$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.260701.1-setup.exe'
  checksum     = 'b60737c5e7557a4e81fa6fb7ccc26d2b148a8f5a0821852105d5ee529b51060b'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
