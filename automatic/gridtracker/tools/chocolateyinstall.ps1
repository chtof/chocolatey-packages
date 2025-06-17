$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.250616.2-setup.exe'
  checksum     = 'b11572dce5ed6c098f013c21c75bfd9baf3c490ac3209f0b3685b74481c4228c'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
