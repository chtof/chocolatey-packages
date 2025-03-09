$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.250201.1-setup.exe'
  checksum     = 'cf812246128e4010d52f0a2534368195f1fb1b97c6cc4447c01a5cc06072d38b'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
