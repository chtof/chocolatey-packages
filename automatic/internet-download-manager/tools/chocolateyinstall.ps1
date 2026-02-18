$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman642build60.exe'
  checksum      = '48fee0be085ce2f1ba328d72538fb117c2fb965fd1827060ea3d520422362900'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
