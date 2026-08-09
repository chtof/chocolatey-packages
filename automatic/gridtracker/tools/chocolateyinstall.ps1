$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.260808.2-setup.exe'
  checksum     = 'f2ff66a0f59b999892c46caf0eefca2a68e0cf54f54b36c3d99e86b9dd34329c'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
