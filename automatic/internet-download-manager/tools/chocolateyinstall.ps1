$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman642build15.exe'
  checksum      = '6d7a7d23e1ab0ee72da6594230b26ff316fd618381c06edf703a0fd3ac5000d6'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
