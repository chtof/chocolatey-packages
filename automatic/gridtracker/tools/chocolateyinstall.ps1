$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.250713.2-setup.exe'
  checksum     = '70a6f1dd8e6901d0938cc0a2bfc94df3b6cd577e8e0f66c1df1be57d3e34a965'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
