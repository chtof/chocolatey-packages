$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman642build51.exe'
  checksum      = '26d2e418e7e4d95c0a5dd74c50d04304dc2ad0e34ec0b8d3b9c6f588a8df94f3'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
