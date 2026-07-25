$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.260723.0-setup.exe'
  checksum     = 'a327c241e4154583a4e5031b36617390a33164b87e11212b53fb7b9a9839d236'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
