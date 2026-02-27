$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.260223.3-setup.exe'
  checksum     = '972e191d0f9d8bc1a62a4f0842506a75e37acbf9e4e7e632c7dee1666e7b4ff1'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
