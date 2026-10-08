$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman643build15.exe'
  checksum      = 'a902e77169a3e4d8a88ee2ccaab11d3d43ab209483625a3602438ed4a22bbfd9'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
