$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://static.bandlab.com/assistant/BandLab%20Assistant%20Setup%2010.3.1.exe'
  checksum      = '0385e5fe00398a17c5512ce6346314e0b89125183758fbf5098ba3b09311d4d0'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
