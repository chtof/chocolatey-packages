$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman642build28.exe'
  checksum      = 'f34cded028d1f729fd872ef8bc813fac24cc1a955a9c06d98f7a43a5a0d75d06'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
