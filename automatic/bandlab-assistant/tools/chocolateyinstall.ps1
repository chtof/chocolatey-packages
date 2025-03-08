$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://static.bandlab.com/assistant/BandLab%20Assistant%20Setup%2010.8.5.exe'
  checksum      = 'ca62d17125d23a3579ac01eca67d9db419acac98ef697339345f646527cb81d7'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
