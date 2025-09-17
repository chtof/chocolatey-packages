$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman642build43.exe'
  checksum      = '3f79c4f6451e76bfad0236c9523bb827b14d3ce87c589f2b8aca58210ecf9a2c'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
