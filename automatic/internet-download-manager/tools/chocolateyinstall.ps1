$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman642build38.exe'
  checksum      = '49f862f66a39600d1778fc29ef3a8c8f3c1854a4b3eaa17e5a9ae445ad50c3e3'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
