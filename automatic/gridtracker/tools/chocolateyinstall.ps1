$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.250820.0-setup.exe'
  checksum     = '9f88508bba2212ef88e869857716def026c788657415ecf50b41eef9c4f15268'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
