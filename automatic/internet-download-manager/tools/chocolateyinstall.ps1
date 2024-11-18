$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman642build25.exe'
  checksum      = 'df5281d752bc4b80fe43e20d044f0c4fceda1ea0e7f60c50bd6a71d2262d9184'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
