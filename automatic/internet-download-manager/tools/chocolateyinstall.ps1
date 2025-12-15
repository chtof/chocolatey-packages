$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman642build58.exe'
  checksum      = 'ecde2f3e0df72061db4c9a871ba8d21d2fe08e85aa74fef56c764f1c3f02f8e8'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
