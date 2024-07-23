$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman642build16.exe'
  checksum      = '47ce416a0b1fd0f7a362f2cade19e4e88b13281c8616ea248b8e02c49c2643fc'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
