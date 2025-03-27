$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman642build30.exe'
  checksum      = 'ecbf5e310ad59ae69932a98c4d33ec43f4a09a6f37641072c65eb6a7fce9a580'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
