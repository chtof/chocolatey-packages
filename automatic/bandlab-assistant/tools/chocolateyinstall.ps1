$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://static.bandlab.com/assistant/BandLab%20Assistant%20Setup%2010.8.6.exe'
  checksum      = 'd4209fdfacc8adc36eed5c1974fbbd3b86b0e89da41ce14c41e50633b9dafd65'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
