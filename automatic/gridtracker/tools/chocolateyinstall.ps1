$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download2.gridtracker.org/GridTracker2-2.250901.0-setup.exe'
  checksum     = 'e3752292bc673c5750824119e607c566636addbcd77535b06b2ccd4aea575a91'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
