$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman643build14.exe'
  checksum      = '5fbb5126ef5e7625d233f5c1c3bd664b6310c028fdfd1f0bc7ee81d15fc5983b'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
