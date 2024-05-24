$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://static.bandlab.com/assistant/BandLab%20Assistant%20Setup%2010.5.0.exe'
  checksum      = '47b1c6ac70186bfbc2e2929331b4aa4e55667de9e470e30d014d113ed8972701'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
