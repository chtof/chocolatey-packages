$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman642build52.exe'
  checksum      = '4cd461943b2b52a8cd481b29afa1dfd4b9aea7848251e393a0284b6c60cd6d58'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
