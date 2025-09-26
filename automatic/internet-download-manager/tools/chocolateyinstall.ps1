$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman642build47.exe'
  checksum      = 'a59442d7f5cbbbf43f491f1f72a319dbb5c61f7574426d4aaa1407bd2a4106c8'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
