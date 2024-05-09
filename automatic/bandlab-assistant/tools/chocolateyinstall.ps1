$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://static.bandlab.com/assistant/BandLab%20Assistant%20Setup%2010.2.6.exe'
  checksum      = 'b4d8c231c0ac4e92168091d826099b98b353458dea63c7696b6151110382f7db'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
