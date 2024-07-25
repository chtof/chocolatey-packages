$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman642build17.exe'
  checksum      = '6fb3984acc4c678d8b6c1b3c4826dff677f4ca48f1ce1b799432e613d90a9731'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
