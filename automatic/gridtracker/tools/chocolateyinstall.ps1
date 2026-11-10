$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.261108.4-setup.exe'
  checksum     = '5af4f89c94ac7563d61c84c66b95b13ff763513f52d8d7c5986234ef9ae0eac6'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
