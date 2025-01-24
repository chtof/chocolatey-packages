$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman642build27.exe'
  checksum      = 'ce11f4450c5f4fdc090a3e655ee5996d2a2234aaa5fc68b618546dbccad00139'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
