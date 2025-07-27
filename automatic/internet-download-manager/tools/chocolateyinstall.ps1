$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman642build42.exe'
  checksum      = '67fb513d0d1fa3e58b4e95dcf8d70e618f4e277474c0e88bc8d1a3e9d0730db1'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
