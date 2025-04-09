$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.250407.2-setup.exe'
  checksum     = 'f809e66c51035bee2e7bb5048680e109dfd2d815e979fbf6f4420cfc555a84f6'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
