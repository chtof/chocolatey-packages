$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman643build17.exe'
  checksum      = 'b8fe3da0212e4f67d09dca0abfd732b3a577e403a793489aaa9ca5ae7e02b263'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
