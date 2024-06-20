$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://static.bandlab.com/assistant/BandLab%20Assistant%20Setup%2010.7.0.exe'
  checksum      = 'a0c4ae2c323d1e03fa2a30e9b8f60267edb66eae7703f70cc4b14ac76de371cb'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
